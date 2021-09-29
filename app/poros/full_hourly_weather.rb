class FullHourlyWeather
  attr_reader :temperature,
              :conditions

  def initialize(weather_info)
    @temperature = weather_info[:temp]
    @conditions = weather_info[:weather][0][:description]
  end
end