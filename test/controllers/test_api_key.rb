ENV['STRIPE_PUBLISHABLE_KEY'] = 'TEST_PK'
ENV['STRIPE_SECRET_KEY'] = 'TEST_SK'

stripe = {
	publishable_key: 	ENV['STRIPE_PUBLISHABLE_KEY'],
	secret_key: 		ENV['STRIPE_SECRET_KEY']
}

sk = stripe[:secret_key]


puts sk