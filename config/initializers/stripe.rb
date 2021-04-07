require 'stripe'
Stripe.api_key = ENV['STRIPE_TEST_SECRET_KEY']
Stripe.api_version = "2020-08-27"

if Rails.env.development? || Rails.env.test?
  Rails.configuration.stripe = {
    :publishable_key => ENV['STRIPE_PUBLISH_KEY'], 
    :secret_key => ENV['STRIPE_TEST_SECRET_KEY'],
  }
end

if Rails.env.production?
  Rails.configuration.stripe = {
    :publishable_key => ENV['STRIPE_PUBLISH_KEY_PRODUCTION'],
    :secret_key => ENV['STRIPE_SECRET_KEY_PRODUCTION'], 
  }
end
