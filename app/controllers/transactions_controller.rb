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
		product = Product.find_by!(
			permalink: params[:permalink]
		)


		sale = @product.sales.create!(
				amount: 		@product.price,
				email: 			params[:email],
				stripe_token: 	params[:stripeToken]
			)
		sale.process!
		if sale.finished?
			redirect_to pickup_url(guid: sale.guid)
		else
			flash.now[:alert] = sale.error
			render :new
		end
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
