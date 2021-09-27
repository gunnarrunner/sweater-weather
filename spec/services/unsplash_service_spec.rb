require 'rails_helper'

RSpec.describe UnsplashService do
  before :each do
  end

  describe 'class methods' do
    describe '.city_photo', :vcr do
      it 'can get a response for a city photo' do
        service = UnsplashService.city_photo('denver,co')

        require "pry"; binding.pry
        expect(service.class).to eq(Hash)
        expect(service[:current].class).to eq(Hash)
        expect(service[:current]).to have_key(:feels_like)
      end
    end
  end
end