require 'rails_helper'

RSpec.describe UnsplashFacade do
  before :each do
    
  end

  it 'can create an array of books', :vcr do
    photo = UnsplashFacade.background('denver,co')

    expect(photo).to be_an_instance_of(Photo)
    expect(photo.source).to eq("https://api.unsplash.com/photos/A4RpHR83luM")
  end
end
