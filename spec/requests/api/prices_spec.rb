require 'rails_helper'

RSpec.describe "Api::PricesController", type: :request do
  describe "GET /api/prices" do
    it "works!" do
      company = create(:company)
      get api_prices_path(company_id: company.id)
      expect(response).to have_http_status(200)
    end

    it "returns the prices for a company" do
      prices = {
        "2021-01-01" => "100.00",
        "2021-01-02" => "110.00",
      }
      company = create(:company, prices: prices)
      get "api/prices?company_id=#{company_id}"
      expect(JSON.parse(response.body)).to eq(prices)
    end
  end
end