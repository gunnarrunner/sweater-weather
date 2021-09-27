require 'rails_helper'

RSpec.describe UnsplashService do
  before :each do
  end

  describe 'class methods' do
    describe '.get_photo', :vcr do
      it 'can get a response for a city photo' do
        service = UnsplashService.get_photo('denver,co')

        expect(service.class).to eq(Hash)
        expect(service[:results].class).to eq(Array)
        expect(service[:results][0]).to have_key(:links)
      end
    end
  end
end