require 'rails_helper'

RSpec.describe StationService do
  before :each do
  end

  describe 'instance methods' do
    describe '#station_details' do
      it 'can get a response' do
        service = StationService.station_details('5224 W 25th Ave, Denver, CO 80214')

        # require "pry"; binding.pry
        expect(service.class).to eq(Hash)
        expect(service[:fuel_stations].class).to eq(Array)
        expect(service[:fuel_stations][0]).to have_key(:station_name)
        expect(service[:fuel_stations][0]).to have_key(:street_address)
        expect(service[:fuel_stations][0]).to have_key(:city)
        expect(service[:fuel_stations][0]).to have_key(:state)
        expect(service[:fuel_stations][0]).to have_key(:zip)
        expect(service[:fuel_stations][0]).to have_key(:fuel_type_code)
        expect(service[:fuel_stations][0]).to have_key(:access_days_time)
      end
    end
  end
end