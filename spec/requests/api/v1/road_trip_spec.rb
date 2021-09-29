require 'rails_helper'

RSpec.describe "Road Trip API", type: :request do

  describe 'POST /road_trip' do
    it 'can give the succsssfull inforamtion about the road trip', :vcr do
      user = create(:user, email: 'test@test.com', password: 'password69', api_key: 'tugma')
      info = {
                  origin: 'Denver, Co',
                  destination: 'Pueblo, Co',
                  api_key: 'tugma'
                }
      
      headers = { 'CONTENT_TYPE' => 'application/json', "Accept": 'application/json' }
                      
      post '/api/v1/road_trip', headers: headers, params: info, as: :json
      
      expect(response.status).to eq(200)
      
      confirmation = JSON.parse(response.body, symbolize_names: true)

      expect(confirmation.class).to eq(Hash)
      expect(confirmation[:data].class).to eq(Hash)
      expect(confirmation[:data][:attributes]).to have_key(:travel_time)
      expect(confirmation[:data][:attributes]).to have_key(:weather_at_eta)
      expect(confirmation[:data][:attributes][:start_city]).to eq(info[:origin])
      expect(confirmation[:data][:attributes][:end_city]).to eq(info[:destination])
    end

    it 'gives an error with not sending the correct origin or destination', :vcr do
      user = create(:user, email: 'test@test.com', password: 'password69', api_key: 'tugma')
      info = {
                  origin: 'Denver, Co',
                  api_key: 'tugma'
                }
      
      headers = { 'CONTENT_TYPE' => 'application/json', "Accept": 'application/json' }
                      
      post '/api/v1/road_trip', headers: headers, params: info, as: :json
      
      expect(response.status).to eq(400)
    end

    it 'gives an error with not sending the correct user api key', :vcr do
      user = create(:user, email: 'test@test.com', password: 'password69', api_key: 'tugma')
      info = {
                  origin: 'Denver, Co',
                  destination: 'Pueblo, Co',
                  api_key: 'sugma'
                }
      
      headers = { 'CONTENT_TYPE' => 'application/json', "Accept": 'application/json' }
                      
      post '/api/v1/road_trip', headers: headers, params: info, as: :json
      
      expect(response.status).to eq(401)
    end

    it 'gives an error with not sending blank destination or origin', :vcr do
      user = create(:user, email: 'test@test.com', password: 'password69', api_key: 'tugma')
      info = {
                  origin: 'Denver, Co',
                  destination: '',
                  api_key: 'tugma'
                }
      
      headers = { 'CONTENT_TYPE' => 'application/json', "Accept": 'application/json' }
                      
      post '/api/v1/road_trip', headers: headers, params: info, as: :json
      
      expect(response.status).to eq(400)
    end

    it 'gives an error with not sending reasonable locations', :vcr do
      user = create(:user, email: 'test@test.com', password: 'password69', api_key: 'tugma')
      info = {
                  origin: 'Denver, Co',
                  destination: 'London, UK',
                  api_key: 'tugma'
                }
      
      headers = { 'CONTENT_TYPE' => 'application/json', "Accept": 'application/json' }
                      
      post '/api/v1/road_trip', headers: headers, params: info, as: :json
      
      expect(response.status).to eq(200)
      
      confirmation = JSON.parse(response.body, symbolize_names: true)
      
      expect(confirmation[:data].class).to eq(Hash)
      expect(confirmation[:data][:attributes]).to have_key(:travel_time)
      expect(confirmation[:data][:attributes]).to have_key(:weather_at_eta)
      expect(confirmation[:data][:attributes][:start_city]).to eq(info[:origin])
      expect(confirmation[:data][:attributes][:end_city]).to eq(info[:destination])
      expect(confirmation[:data][:attributes][:travel_time]).to eq("Impossible route")
      expect(confirmation[:data][:attributes][:weather_at_eta][:temperature]).to eq("No Weather avaiable")
      expect(confirmation[:data][:attributes][:weather_at_eta][:conditions]).to eq("No Weather avaiable")

    end
  end
end