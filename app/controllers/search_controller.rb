class SearchController < ApplicationController

  def index
    response = Faraday.get("https://api.bestbuy.com/v1/stores(area(80202,25))?format=json&show=storeId,storeType,longName,city,distance,phone&pageSize=15&apiKey=#{ENV["BEST_BUY_KEY"]}")
    info = JSON.parse(response.body, symbolize_names: true)
    stores_info = info[:stores]
    @stores = stores_info.map do |store_info|
      Store.new(store_info)
    end
    @counts = [info[:total], info[:to]]
  end

end
