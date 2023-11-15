require 'rails_helper'

RSpec.describe UpdateTickersJob, type: :job do
  it "Fetches tickers from SEC" do
    body = <<~DOC
      msft   789019
      brk-b  1067983
    DOC
    stub_request(:get, "http://www.sec.gov/include/ticker.txt")
      .to_return(status: 200, body: body, headers: {})

    UpdateTickersJob.perform_now
  end
end