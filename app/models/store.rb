class Store

  attr_reader :name,
              :phone,
              :city,
              :distance,
              :address,
              :state,
              :zip,
              :store_type,
              :sid,
              :hours

  def initialize(attributes)
    @sid = attributes[:storeId]
    @name = attributes[:longName]
    @phone = attributes[:phone]
    @city = attributes[:city]
    @address = attributes[:address]
    @state = attributes[:region]
    @zip = attributes[:postalCode]
    @distance = attributes[:distance]
    @store_type = attributes[:storeType]
    @hours = attributes[:hours]
  end

  def self.get_stores_by_zip(zip)
    info = BestBuyService.get_stores_by_zip(zip)
    stores_info = info[:stores]
    stores = process_stores_information(stores_info)
    counts = [info[:total], info[:to]]
    [stores, counts]
  end

  def self.process_stores_information(stores_info)
    stores_info.map do |store_info|
      Store.new(store_info)
    end
  end

  def self.get_store_by_id(params)
    hour_info = BestBuyService.get_store_by_id(params[:id])
    hours = hour_info[:stores][0][:hours]
    store_info = {address: params[:address], city: params[:city], longName: params[:name], region: params[:state], postalCode: params[:zip], storeId: params[:id], storeType: params[:store_type], hours: hours}
    Store.new(store_info)
  end


end
