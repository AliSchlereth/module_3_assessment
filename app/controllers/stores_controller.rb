class StoresController < ApplicationController

  def show
    hour_info = Store.get_store_by_id(params[:id])
    hours = hour_info[:stores][0][:hours]
    store_info = {address: params[:address], city: params[:city], longName: params[:name], region: params[:state], postalCode: params[:zip], storeId: params[:id], storeType: params[:store_type], hours: hours}
    @store = Store.new(store_info)
  end

end
