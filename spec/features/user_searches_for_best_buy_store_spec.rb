require "rails_helper"

describe "user searches for a Best Buy store" do
  context "they enter zip code into search bar" do
    it "returns 15 stores within a 25mi radius" do
      visit "/"
      fill_in "search", with: 80202
      click_on "Search"

      expect(current_path).to eq(search_path)
      expect(page).to have_content("16 Total Stores")
      expect(page).to have_content("Name: Best Buy Mobile - Cherry Creek Shopping Center")
      expect(page).to have_content("City: Denver")
      expect(page).to have_content("Distance: 3.25")
      expect(page).to have_content("Phone: 303-270-9189")
      expect(page).to have_content("Store Type: Mobile")
    end
  end

  context "user clicks link to a specific stores" do
    it "displays a single stores information" do
      visit "/"
      fill_in "search", with: 80202
      click_on "Search"
      click_on "Best Buy Mobile - Cherry Creek Shopping Center"

      # expect(current_path)
    end
  end
end
# As a user
# After I have searched a zip code for stores
# When I click the name of a store
# Then my current path should be "/stores/:store_id"
# I should see the store name, store type and address with city, state and zip
# I should see an unordered list of the store hours in the following format:
#   * Mon: 10am-9pm
#   * Tue: 10am-9pm
#   * Wed: 10am-9pm
#   * Thurs: 10am-9pm
#   * Fri: 10am-9pm
#   * Sat: 10am-9pm
#   * Sun: 11am-7pm
