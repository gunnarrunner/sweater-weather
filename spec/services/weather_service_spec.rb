require 'rails_helper'

RSpec.describe WeatherService do
  before :each do
  end

  describe 'class methods' do
    describe '.weather', :vcr do
      it 'can get a response for weather' do
        service = WeatherService.location(39.738453, -104.984853)

        expect(service.class).to eq(Hash)
        expect(service[:current].class).to eq(Hash)
        expect(service[:current]).to have_key(:feels_like)
      end
    end
  end
end