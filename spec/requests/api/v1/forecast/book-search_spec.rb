require 'rails_helper'

RSpec.describe "book-search API", type: :request do

  describe 'GET /book-search' do
    it 'can give the books for a given location', :vcr do

      get '/api/v1/book-search?location=denver,co&quantity=5'
      
      expect(response.status).to eq(200)
      
      books = JSON.parse(response.body, symbolize_names: true)

      expect(forecasts.class).to eq(Hash)
      # expect(forecasts[:data][:attributes][:current_weather].class).to eq(Hash)
      # expect(forecasts[:data][:attributes][:daily_weather].class).to eq(Array)
      # expect(forecasts[:data][:attributes][:hourly_weather].class).to eq(Array)
      # expect(forecasts[:data][:attributes][:daily_weather].size).to eq(5)
      # expect(forecasts[:data][:attributes][:hourly_weather].size).to eq(8)
    end

    xit 'gives an error with not sending params through', :vcr do
      get '/api/v1/forecast'
      
      expect(response.status).to eq(400)
    end
  end
end