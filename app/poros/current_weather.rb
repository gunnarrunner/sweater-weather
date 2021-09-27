class CurrentWeather
  attr_reader :datetime,
              :sunrise,
              :sunset,
              :temperature,
              :feels_like,
              :humidity, 
              :uvi,
              :visibility,
              :conditions,
              :icon
  def initialize(weather_info)
    @datetime = Time.at(weather_info[:dt]).strftime('%F %T %:z')
    @sunrise = Time.at(weather_info[:sunrise]).strftime('%F %T %:z')
    @sunset = Time.at(weather_info[:sunset]).strftime('%F %T %:z')
    @temperature = weather_info[:temp]
    @feels_like = weather_info[:feels_like]
    @humidity = weather_info[:humidity]
    @uvi = weather_info[:uvi]
    @visibility = weather_info[:visibility]
    @conditions = weather_info[:weather][0][:description]
    @icon = weather_info[:weather][0][:icon]
  end
end