class Photo
  attr_reader :description,
              :photo,
              :source,
              :photographer_name,
              :photographer_profile
  def initialize(photo_info)
    @description = photo_info[:description]
    @photo = photo_info[:urls][:full]
    @source = photo_info[:links][:self]
    @photographer_name = photo_info[:user][:name]
    @photographer_profile = photo_info[:user][:links][:photos]
  end
end