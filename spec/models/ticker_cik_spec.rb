require 'rails_helper'

RSpec.describe TickerCik, type: :model do
  it "creates a TickerCik record" do
    expect {
      create(:ticker_cik, ticker: "msft", cik: "789019")
    }.to change { TickerCik.count }.by(1)
  endend
