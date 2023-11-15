class CreateStripeCustomerJob < ApplicationJob
    require 'stripe'
    queue_as :default
  
    # def perform(user_id)
    #  @user = User.find(user_id)

    #  customer = Stripe::Customer.create(
    #     email: @user.email,
    #     metadata: {
    #         user_id: @user.id
    #     },
    #  )

    #  @user.update(stripe_customer_id: customer.id)
    end
  