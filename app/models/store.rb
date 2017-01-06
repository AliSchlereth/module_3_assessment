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


end
