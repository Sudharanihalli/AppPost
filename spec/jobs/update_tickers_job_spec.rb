require 'rails_helper'

RSpec.describe UpdateTickersJob, type: :job do
  it "Should work with stubbed body" do
    body = "msft\t789019\nbrk-b\t1067983\n"
    stub_request(:get, "http://www.sec.gov/include/ticker.txt")
      .to_return(status: 200, body: body, headers: {})
    UpdateTickersJob.perform_now
  end

  it "fetches and processes data from the external source" do
    body = "msft\t789019\nbrk-b\t1067983\n"
    stub_request(:get, "http://www.sec.gov/include/ticker.txt")
      .to_return(status: 200, body: body, headers: {})

    expect {
      UpdateTickersJob.perform_now
      expect(Ticker.count).to eq(2)
      expect(TickerCik.find_by(ticker: "amzn").cik).to eq("1018724")
      expect(TickerCik.find_by(ticker: "goog").cik).to eq("1652044")
    }
  end
end