class PaymentsController < ApplicationController
  def create
    @product = Product.find(params[:product_id])
    @user = current_user
    token = params[:stripeToken]
    # Create the charge on Stripe's servers - this will charge the user's card
    begin
      charge = Stripe::Charge.create(
          :amount => (@product.price * 100).to_i,
          :currency => "eur",
          :source => token,
          :description => params[:stripeEmail]
      )
      if charge.paid
        Order.create(
          :product_id => @product,
          :user_id => @user,
          :total => @product.price
        )
      end
    rescue Stripe::CardError => e
      # The card has been declined
    end
  end
end
