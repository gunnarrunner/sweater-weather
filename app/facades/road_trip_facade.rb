class RoadTripFacade
  def self.destination_info(origin, destination)
    time = GeocodeService.get_directions(origin, destination)
    lat = GeocodeFacade.location(destination)[0].latitude
    long = GeocodeFacade.location(destination)[0].longitude
    forecast = WeatherFacade.forty_eight_hour_forecast(lat, long)


    RoadTrip.new(time, forecast)
  end
end