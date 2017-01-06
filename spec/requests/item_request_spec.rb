require "rails_helper"

describe "item requests" do
  context "get all items" do
    it "returns all items" do
      item1 = Item.create(name: "Name", description: "description", image_url: "http://image.jpg")
      item2 = Item.create(name: "Name2", description: "description2", image_url: "http://image2.jpg")

      get "/api/v1/items"

      items = JSON.parse(response.body)

      expect(response).to be_success
      expect(items).to be_an(Array)
      expect(items[0]).to have_key('id')
      expect(items[0]).to have_key('name')
      expect(items[0]).to have_key('description')
      expect(items[0]).to have_key('image_url')
      expect(items[0]).to_not have_key('created_at')
      expect(items[0]).to_not have_key('updated_at')
    end
  end
end
