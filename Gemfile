source 'https://code.stripe.com' do
	gem 'stripe'
end

source 'https://rubygems.org'
ruby "2.2.0"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.0'
# Use postgresql as the database for Active Record
gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. 
# Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use Devise for users and authentication
gem 'devise', '~> 3.4.1'

# Paperclip to attach downloadable files to the product record.
gem 'paperclip', '~> 4.2.1'

# Make sure Rails' asset pipeline plays well with Heroku
gem 'rails_12factor', group: :production

# Store uploaded file with Paperclip on Amazon Web Services
gem 'aws-sdk', '< 2.0'

# Use HTTParty to get the data to and from S3 (AWS)
  gem 'httparty'

# Use Mocha for macking and stubbing
  gem 'mocha', :require => false

group :development do
  gem 'stripe-ruby-mock', '~> 2.0.4', :require => 'stripe_mock'
	gem 'database_cleaner'
	# Check current app for rails best practices
	gem 'rails_best_practices'
  #Check current app for security vulnerabilities and suggest fixes
  gem 'brakeman'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

