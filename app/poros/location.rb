class Location
  attr_reader :longitude,
              :latitude
  def initialize(location_info)
    @longitude = location_info[:latLng][:lng]
    @latitude = location_info[:latLng][:lat]
  end
end