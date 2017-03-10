if Rails.env.production?
  Rails.configuration.stripe = {
      :publishable_key => ENV['STRIPE_PUBLISHABLE_KEY'],
      :secret_key => ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
      :publishable_key => 'pk_test_TmvT9iGuHsfAn1IqQGdpd1Fl',
      :secret_key => 'sk_test_5FGv7KFlLvQ5xgeD3gIeY4lQ'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]