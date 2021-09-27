require 'rails_helper'

RSpec.describe LibraryService do
  before :each do
  end

  describe 'class methods' do
    describe '.books_info', :vcr do
      it 'can get a response for a books about denver' do
        service = LibraryService.books_info('denver,co', 5)

        expect(service.class).to eq(Hash)
        expect(service[:docs].class).to eq(Array)
        expect(service[:docs][0]).to have_key(:title)
      end
    end
  end
end