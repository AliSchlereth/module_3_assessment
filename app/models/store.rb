class Store

  attr_reader :name,
              :phone,
              :city,
              :distance,
              :store_type

  def initialize(attributes)
    @sid = attributes[:id]
    @name = attributes[:longName]
    @phone = attributes[:phone]
    @city = attributes[:city]
    @distance = attributes[:distance]
    @store_type = attributes[:storeType]
  end


end
