require "rails_helper"

describe "Store" do
  context "get stores by zip " do
    it "returns info for search including 15 stores within 25miles of given zip" do
      stores_info = Store.get_stores_by_zip(60175)

      expect(stores_info[0]).to be_an(Array)
      expect(stores_info[0].count).to eq(15)
      expect(stores_info[0][0]).to respond_to('name')
      expect(stores_info[0][0]).to respond_to('store_type')
      expect(stores_info[0][0]).to respond_to('distance')
      expect(stores_info[0][0]).to respond_to('city')
      expect(stores_info[0][0]).to respond_to('phone')
    end
  end

  context "get store by id" do
    it "returns a store by a given params with id" do
      params = {address: "3000 East First Ave",
                 city: "Denver",
                 name: "Best Buy Mobile - Cherry Creek Shopping Center",
                 state: "CO",
                 store_type: "Mobile",
                 zip: "80206",
                 action: "show",
                 controller: "stores",
                 id: "2740"}
      store = Store.get_store_by_id(params)

      expect(store).to be_a(Store)
      expect(store).to respond_to('name')
      expect(store).to respond_to('store_type')
      expect(store).to respond_to('address')
      expect(store).to respond_to('city')
      expect(store).to respond_to('state')
      expect(store).to respond_to('zip')
      expect(store).to respond_to('hours')

    end
  end
end
