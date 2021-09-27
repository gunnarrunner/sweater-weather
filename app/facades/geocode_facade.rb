class GeocodeFacade
  def self.location(location_params)
    service = GeocodeService.location(location_params)

    service[:results][0][:locations].map do |hash|
      Location.new(hash)
    end
  end
end