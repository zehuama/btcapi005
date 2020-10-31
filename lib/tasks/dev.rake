namespace :dev do
  task :fetch_ticker => :environment do
    puts "Fetch ticker data..."
    response = RestClient.get "http://api.hadax.com/market/tickers"
    data = JSON.parse(response.body)

    data["data"].each do |t|
      existing_symbol = Ticker.find_by_symbol( t["symbol"] )
      if existing_symbol.nil?
        Ticker.create!( :symbol => t["symbol"],
                      :openPrice => t["open"], :closePrice => t["close"],
                      :openTime => "00:00" )
      end
    end

    puts "Total: #{Ticker.count} symbols"
  end
end
