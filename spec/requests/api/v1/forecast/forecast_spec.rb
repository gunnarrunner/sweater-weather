require 'rails_helper'

RSpec.describe "Forecast API", type: :request do

  describe 'GET /forecast' do
    it 'can give the forecast for a given location', :vcr do

      get '/api/v1/forecast?location=denver,co'
      
      expect(response.status).to eq(200)
      
      forecasts = JSON.parse(response.body, symbolize_names: true)

      # expect(merchants.class).to eq(Hash)
      # expect(merchants[:data].class).to eq(Array)
      
      # expect(merchants[:data].count).to eq(20)

      # merchants[:data].each do |merchant|
      #   expect(merchant[:attributes]).to have_key(:name)
      #   expect(merchant[:attributes][:name]).to be_a(String)
      # end
    end
  end
end