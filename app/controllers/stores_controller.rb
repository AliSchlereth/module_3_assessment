class StoresController < ApplicationController

  def show
    hour_info = Store.get_store_by_id(params[:id])
    # response = Faraday.get("https://api.bestbuy.com/v1/stores(storeId=#{params[:id]})?format=json&show=hours,hoursAmPm,gmtOffset,detailedHours&apiKey=#{ENV["BEST_BUY_KEY"]}")
    # hour_info = JSON.parse(response.body, symbolize_names: true)
    hours = hour_info[:stores][0][:hours]
    store_info = {address: params[:address], city: params[:city], longName: params[:name], region: params[:state], postalCode: params[:zip], storeId: params[:id], storeType: params[:store_type], hours: hours}
    @store = Store.new(store_info)
  end

end
