require 'rails_helper'

RSpec.describe RoadTripFacade do
  before :each do
    
  end

  it 'can get a road trips weather information', :vcr do
    road_trip = RoadTripFacade.destination_info('denver,co', 'pueblo,co')

    expect(road_trip).to be_an_instance_of(RoadTrip)
  end
end
