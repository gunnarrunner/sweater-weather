class HourlyWeather
  attr_reader :date_time,
              :temperature,
              :conditions,
              :icon
  def initialize(weather_info)
    @date_time = Time.at(weather_info[:dt]).strftime('%F')
    @temperature = weather_info[:temp]
    @conditions = weather_info[:weather][0][:description]
    @icon = weather_info[:weather][0][:icon]
  end
end