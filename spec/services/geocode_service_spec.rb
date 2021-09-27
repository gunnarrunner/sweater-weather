require 'rails_helper'

RSpec.describe GeocodeService do
  before :each do
  end

  describe 'class methods' do
    describe '.location', :vcr do
      it 'can get a response for goecode' do
        service = GeocodeService.location('denver,co')

        expect(service.class).to eq(Hash)
        expect(service[:results].class).to eq(Array)
        expect(service[:results][0][:locations][0]).to have_key(:latLng)
      end
    end
  end
end