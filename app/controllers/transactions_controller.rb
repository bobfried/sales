class TransactionsController < ApplicationController
	skip_before_action :authenticate_user!
	before_filter :strip_iframe_protection

	before_filter :find_product, only: [:iframe, :new, :create]

	def new
		@sale = Sale.new(product_id: @product.id)
		set_page_title "Buy #{@product.name}"
	end

	def iframe
		@sale = Sale.new(product_id: @product.id)
	end		

	def show
		@sale = Sale.find_by!(guid: params[:guid])
		@product = @sale.product
	end

	def pickup
		@sale = Sale.find_by!(guid: params[:guid])
		@product = @sale.product
	end

	def create
		product = Product.find_by!(permalink: params[:permalink])

		token = params[:stripeToken]

		sale = Sale.new do |s|
			s.amount =	product.price,
			s.product_id = product.id,
			s.stripe_token = token,
			s.email = params[:email]
		end

		if sale.save
			StripeCharger.perform_async(sale.guid)
			render json: { guid: sale.guid }
		else
			errors = sale.errors.full_messages
			render json: {
				error: errors.join(" ")
			}, status: 400
		end
	end

	def status
		sale = Sale.find_by!(guid: params[:guid])

		render json: {status: sale.state }
	end


	def download
		@sale = Sale.find_by!(guid: params[:guid])

		resp = HTTParty.get(@sale.product.file.url)

		filename = @sale.product.file.url
		send_data resp.body,
			:filename => File.basename(filename),
			:content_type => resp.headers['Content-Type']			
	end

private
	def strip_iframe_protection
		response.headers.delete('X-Frame-Options')			
	end	

	def find_product
		@product = Product.find_by!(permalink: params[:permalink])
	end
	
end
