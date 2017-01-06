class SearchController < ApplicationController

  def index
    response = Faraday.get("https://api.bestbuy.com/v1/stores(area(80202,25))?format=json&show=storeId,storeType,longName,city,distance,phone&pageSize=15&apiKey=8zjkc9r7xng9wvqqjayyeya9")
    stores = JSON.parse(response.body, symbolize_names: true)[:stores]
    
  end

end
