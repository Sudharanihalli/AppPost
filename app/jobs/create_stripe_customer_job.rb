class CreateStripeCustomerJob < ApplicationJob
    require 'stripe'
    queue_as :default
    end
  