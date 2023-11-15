require 'rails_helper'

RSpec.describe CreateStripeCustomerJob, type: :job do
  it "creates a Stripe customer and saves its ID to the user" do
    allow(Stripe::Customer).to receive(:create).and_return( Stripe::Customer.new(id: "cus_test"))

    user = create(:user)

    expect {
      CreateStripeCustomerJob.perform_later(user.id)
    }.to have_enqueued_job(CreateStripeCustomerJob)
  end 
end
