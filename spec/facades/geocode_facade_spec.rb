require 'rails_helper'

RSpec.describe GeocodeFacade do
  before :each do
    
  end

  it 'can create an array of stations', :vcr do
    location = GeocodeFacade.location('denver,co')

    expect(location[0]).to be_an_instance_of(Location)
    expect(location.count).to eq(2)
  end
end
