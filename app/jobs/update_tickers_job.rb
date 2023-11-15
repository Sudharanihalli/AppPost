class UpdateTickersJob < ApplicationJob
 queue_as :default

 def perform
    mapping = RestClient
    .get("http://www.sec.gov/include/ticker.txt")
    .body
    .split("\n")
    .map {|pair| pair.split("\t")}

    bybug
    mapping.each do |(ticker, cik)|
        TickerCik.find_or_create_by!(ticker: ticker, cik: cik)
    end 
  end 
end