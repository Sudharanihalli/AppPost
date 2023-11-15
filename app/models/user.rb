class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_commit :create_stripe_customer, on: :create

  def subscribe?
    subscription_status == 'active'
  end

  def create_stripe_customer
    CreateStripeCustomerJob.perform_later(id)
  end
end
