require 'rails_helper'

RSpec.describe "book-search API", type: :request do

  describe 'GET /book-search' do
    it 'can give the books for a given location', :vcr do
      book_quantity = 5
      get "/api/v1/book-search?location=denver,co&quantity=#{book_quantity}"
      
      expect(response.status).to eq(200)
      
      books = JSON.parse(response.body, symbolize_names: true)

      expect(books.class).to eq(Hash)
      expect(books[:data].class).to eq(Hash)
      expect(books[:data][:attributes].class).to eq(Hash)
      expect(books[:data][:attributes]).to have_key(:destination)
      expect(books[:data][:attributes]).to have_key(:forecast)
      expect(books[:data][:attributes]).to have_key(:total_books_found)
      expect(books[:data][:attributes]).to have_key(:books)
      expect(books[:data][:attributes][:books].size).to eq(book_quantity)
    end

    it 'gives an error with not sending params through', :vcr do
      get '/api/v1/book-search'
      
      expect(response.status).to eq(400)
    end
  end
end