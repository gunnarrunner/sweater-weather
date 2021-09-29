require 'rails_helper'

RSpec.describe "Users API", type: :request do

  describe 'POST /users' do
    it 'can give the forecast for a given location', :vcr do

      registration = {
                        email: 'test@test.com',
                        password: 'password69',
                        password_confirmation: 'password69'
                      }
      
      headers = { 'CONTENT_TYPE' => 'application/json', "Accept": 'application/json' }
                      
      post '/api/v1/users', headers: headers, params: registration, as: :json
      
      expect(response.status).to eq(201)
      
      confirmation = JSON.parse(response.body, symbolize_names: true)

      expect(confirmation.class).to eq(Hash)
      expect(confirmation[:data].class).to eq(Hash)
      expect(confirmation[:data]).to have_key(:id)
      expect(confirmation[:data][:attributes].size).to eq(2)
      expect(confirmation[:data][:attributes]).to have_key(:email)
      expect(confirmation[:data][:attributes]).to have_key(:api_key)
    end

    it 'gives an error with not sending the correct password and confirmation body through', :vcr do

      registration = {
                        email: 'test@test.com',
                        password: 'password69',
                        password_confirmation: 'password'
                      }
      
      headers = { 'CONTENT_TYPE' => 'application/json', "Accept": 'application/json' }
                      
      post '/api/v1/users', headers: headers, params: registration, as: :json
      
      expect(response.status).to eq(409)
    end

    it 'gives an error with not sending the correct email type body through', :vcr do

      registration = {
                        email: '123',
                        password: 'password69',
                        password_confirmation: 'password69'
                      }
      
      headers = { 'CONTENT_TYPE' => 'application/json', "Accept": 'application/json' }
                      
      post '/api/v1/users', headers: headers, params: registration, as: :json
      
      expect(response.status).to eq(409)
    end

    it 'gives an error with not sending the correct email type body through', :vcr do
      create(:user, email: 'test@test.com', password: '1234')
      registration = {
                        email: 'test@test.com',
                        password: 'password69',
                        password_confirmation: 'password69'
                      }
      
      headers = { 'CONTENT_TYPE' => 'application/json', "Accept": 'application/json' }
                      
      post '/api/v1/users', headers: headers, params: registration, as: :json
      
      expect(response.status).to eq(409)
    end
  end
end