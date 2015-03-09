class SubscriptionsController < ApplicationController
	skip_before_filter :authenticate_user!

	before_filter :load_plans

	def index		
	end

	def new
		@subscription = Subscription.new
		@plan = Plan.find(params[:plan_id])
	end

	def create
		@plan = Plan.find(params[:plan_id])
		@subscription = CreateSubscription.call(
			@plan,
			params[:email_address],
			params[:stripeToken]
		)
		if @subscription.errors.blank?
			flash[:notice] = 'Thank you for your purchase!' +
				'Please click the link in the email we just sent' +
				'you to get started.'
			redirect_to '/'
		else
			render :new
		end
	end

protected

	def load_plans
		@plans = Plan.where(published: true).order('amount')		
	end	
	
end