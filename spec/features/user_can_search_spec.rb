require 'rails_helper'

describe 'as a user when I visit /' do
  before(:each) do
    # When I visit "/"
    visit '/'
    # And I fill in the search form with 80203 (Note: Use the existing search form)
    fill_in :q, with: "80203"
    # And I click "Locate"
    click_on "Locate"

    @stations = Search.last
  end
  it 'when I fill in search and click locate I am redirected to /search' do
    # Then I should be on page "/search"
    expect(current_path).to eq('/search')
  end

  xit 'and search, I should see a list of the 10 closest stations within 6 miles sorted by distance' do
    # Then I should see a list of the 10 closest stations within 6 miles sorted by distance
    expect(page).to have_content("Closest Stations")
    # And the stations should be limited to Electric and Propane
    # And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times
    within('.stations') do
      @stations.each do |station|
        expect(station.fuel_type).to eq("LPG" || "ELEC")
        expect(station.name).to exist
        expect(station.address).to exist
        expect(station.fuel_type).to exist
        expect(station.distance).to exist
        expect(station.access_time).to exist
      end
    end
  end
end
