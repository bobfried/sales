class StripeMailer < ActionMailer::Base
	default from: 'bobfried@centurylink.net'

	def admin_dispute_created(charge)
		@charge = charge
		@sale = Sale.find_by(stripe_id: @charge.id)
		if @sale
			mail(to: 'bobfried@centurylink.net', subject: "Dispute created on charge 
				#{@sale.guid} (#{charge.id}").deliver
		end
	end

	def admin_charge_succeeded(charge)
		@charge = charge
		mail(to: 'bobfried@centurylink.net', subject: 'Woo! Charge Succeeded!')
	end

	def receipt(charge)
		@charge = charge
		@sale = Sale.find_by!(stripe_id: @charge.id)
		mail(to: @sale.email, subject: "Thanks for purchasing #{@sale.product.name}")
	end
end