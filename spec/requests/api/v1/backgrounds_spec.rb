require 'rails_helper'

RSpec.describe "Background API", type: :request do

  describe 'GET /backgrounds' do
    it 'can give the forecast for a given location', :vcr do

      get '/api/v1/backgrounds?location=denver,co'
      
      expect(response.status).to eq(200)
      
      background = JSON.parse(response.body, symbolize_names: true)

      expect(background.class).to eq(Hash)
      expect(background[:data].class).to eq(Hash)
      expect(background[:data][:attributes].class).to eq(Hash)
      expect(background[:data][:attributes].size).to eq(1)
      expect(background[:data][:attributes][:image]).to have_key(:credit)
    end

    it 'gives an error with not sending params through', :vcr do
      get '/api/v1/backgrounds'
      
      expect(response.status).to eq(400)
    end
  end
end