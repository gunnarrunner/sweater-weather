require 'rails_helper'

RSpec.describe "Sessions API", type: :request do

  describe 'POST /sessions' do
    it 'can give the succsssfully log someone in', :vcr do
      user = create(:user, email: 'test@test.com', password: 'password69')
      login = {
                  email: 'test@test.com',
                  password: 'password69',
                }
      
      headers = { 'CONTENT_TYPE' => 'application/json', "Accept": 'application/json' }
                      
      post '/api/v1/sessions', headers: headers, params: login, as: :json
      
      expect(response.status).to eq(200)
      
      confirmation = JSON.parse(response.body, symbolize_names: true)

      expect(confirmation.class).to eq(Hash)
      expect(confirmation[:data].class).to eq(Hash)
      expect(confirmation[:data][:id]).to eq(user.id)
      expect(confirmation[:data][:attributes].size).to eq(2)
      expect(confirmation[:data][:attributes][:email]).to eq(user.email)
      expect(confirmation[:data][:attributes][:api_key]).to eq(user.api_key)
    end

    it 'gives an error with not sending the correct password through', :vcr do
      user = create(:user, email: 'test@test.com', password: 'password69')
      login = {
                        email: 'test@test.com',
                        password: 'password',
                      }
      
      headers = { 'CONTENT_TYPE' => 'application/json', "Accept": 'application/json' }
                      
      post '/api/v1/sessions', headers: headers, params: login, as: :json
      
      expect(response.status).to eq(401)
    end

    it 'gives an error with not sending the correct email through', :vcr do
      user = create(:user, email: 'test@test.com', password: 'password69')
      login = {
                        email: 'test1@test.com',
                        password: 'password69',
                      }
      
      headers = { 'CONTENT_TYPE' => 'application/json', "Accept": 'application/json' }
                      
      post '/api/v1/sessions', headers: headers, params: login, as: :json
      
      expect(response.status).to eq(401)
    end
  end
end