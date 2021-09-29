class WeatherFacade
  def self.current_weather(lat, long)
    service = WeatherService.location(lat, long)

    CurrentWeather.new(service[:current])
  end

  def self.daily_weather(lat, long)
    service = WeatherService.location(lat, long)

    service[:daily][0..4].map do |hash|
      DailyWeather.new(hash)
    end
  end

  def self.hourly_weather(lat, long)
    service = WeatherService.location(lat, long)

    service[:hourly][0..7].map do |hash|
      HourlyWeather.new(hash)
    end
  end

  def self.forecast(lat, long)
    Forecast.new(current_weather(lat, long), daily_weather(lat, long), hourly_weather(lat, long))
  end

  def self.forty_eight_hour_forecast(lat, long)
    service = WeatherService.location(lat, long)
    
    service[:hourly].map do |hour|
      FullHourlyWeather.new(hour)   
    end
  end
end