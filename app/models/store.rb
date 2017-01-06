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
    # response = Faraday.get("https://api.bestbuy.com/v1/stores(area(#{zip},25))?format=json&show=storeId,storeType,longName,city,distance,phone,address,region,postalCode&pageSize=15&apiKey=#{ENV["BEST_BUY_KEY"]}")
    # info = JSON.parse(response.body, symbolize_names: true)
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


end
