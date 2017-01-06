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
end
