require 'rails_helper'

RSpec.describe LibraryFacade do
  before :each do
    
  end

  it 'can create an array of books', :vcr do
    books = LibraryFacade.books('denver,co', 5)

    expect(books[0]).to be_an_instance_of(Book)
    expect(books.count).to eq(5)
  end
end
