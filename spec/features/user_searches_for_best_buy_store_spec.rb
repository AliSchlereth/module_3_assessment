require "rails_helper"

describe "user searches for a Best Buy store" do
  context "they enter zip code into search bar" do
    it "returns 15 stores within a 25mi radius" do
      visit "/"
      fill_in "search", with: 80202

      expect(current_path).to eq(search_path)
      expect(page).to have_content("16 Total Stores")
      expect(page).to have_content("Name: Best Buy Mobile - Cherry Creek Shopping Center")
      expect(page).to have_content("City: Denver")
      expect(page).to have_content("Distance: 3.25")
      expect(page).to have_content("Phone: 303-270-9189")
      expect(page).to have_content("Store Type: Mobile")
    end
  end
end
