class UpdateTickersJob < ApplicationJob
 queue_as :default

 def perform
  begin
    response = RestClient.get("http://www.sec.gov/include/ticker.txt")
    process_response(response)
  rescue RestClient::ExceptionWithResponse => e
    Rails.logger.error("Error fetching data from external source: #{e.response}")
  rescue StandardError => e
    Rails.logger.error("Unexpected error: #{e.message}")
  end
end

private

def process_response(response)
  mapping = response.body.split("\n").map { |pair| pair.split("\t") }
  mapping.each do |(ticker, cik)|
    TickerCik.find_or_create_by!(ticker: ticker, cik: cik)
    end 
  end 
end