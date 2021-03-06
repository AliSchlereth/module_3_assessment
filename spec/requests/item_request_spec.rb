require "rails_helper"

describe "item requests" do
  before :each do
    @item1 = Item.create(name: "Name", description: "description", image_url: "http://image.jpg")
    @item2 = Item.create(name: "Name2", description: "description2", image_url: "http://image2.jpg")
  end
  context "get all items" do
    it "returns all items" do

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

  context "get one items" do
    it "returns an item by id" do

      get "/api/v1/items/#{@item1.id}"

      item = JSON.parse(response.body)

      expect(response).to be_success
      expect(item).to be_a(Hash)
      expect(item).to have_key('id')
      expect(item).to have_key('name')
      expect(item).to have_key('description')
      expect(item).to have_key('image_url')
      expect(item).to_not have_key('created_at')
      expect(item).to_not have_key('updated_at')
    end
  end

  context "delete an item" do
    it "returns a deleted item" do

      delete "/api/v1/items/#{@item1.id}"

      item = JSON.parse(response.body)

      expect(response).to be_success
      expect(item).to be_an(Hash)
      expect(item).to have_key('id')
      expect(item).to have_key('name')
      expect(item).to have_key('description')
      expect(item).to have_key('image_url')
      expect(item).to_not have_key('created_at')
      expect(item).to_not have_key('updated_at')
    end
  end

  context "create an item" do
    it "returns a created item" do
      headers = {"CONTENT-TYPE" => "application/json"}
      params = {item: {name: "Name3", description: "describe me", image_url: "image"}}.to_json

      post "/api/v1/items", params, headers

      item = JSON.parse(response.body)

      expect(response.status).to eq(201)
      expect(item).to be_an(Hash)
      expect(item).to have_key('id')
      expect(item['name']).to eq("Name3")
      expect(item['description']).to eq('describe me')
      expect(item['image_url']).to eq("image")
      expect(item).to_not have_key('created_at')
      expect(item).to_not have_key('updated_at')
    end
  end







end
