require 'rails_helper'

RSpec.describe User, type: :model do
  it "enqueues the stripe customer create job on commit" do
    expect {
      create(:user)
    }.to have_enqueued_job(CreateStripeCustomerJob)
  end 
end
