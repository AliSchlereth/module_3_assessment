class BestBuyService

  def self.get_stores_by_zip(zip)
    response = Faraday.get("https://api.bestbuy.com/v1/stores(area(#{zip},25))?format=json&show=storeId,storeType,longName,city,distance,phone,address,region,postalCode&pageSize=15&apiKey=#{ENV["BEST_BUY_KEY"]}")
    JSON.parse(response.body, symbolize_names: true)
  end


end
