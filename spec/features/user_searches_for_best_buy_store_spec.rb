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

      expect(page).to have_content("Name: Best Buy Mobile - Cherry Creek Shopping Center")
      expect(page).to have_content("Store Type: Mobile")
      expect(page).to have_content("3000 East First Ave")
      expect(page).to have_content("Denver CO, 80206")
      expect(page).to have_content("Mon: 10-9; Tue: 10-9; Wed: 10-9; Thurs: 10-9; Fri: 10-9; Sat: 10-9; Sun: 10-6")
    end
  end
end
