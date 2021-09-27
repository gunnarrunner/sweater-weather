class DailyWeather
  attr_reader :datetime,
              :sunrise,
              :sunset,
              :min_temp,
              :max_temp,
              :conditions,
              :icon
  def initialize(weather_info)
    @date_time = Time.at(weather_info[:dt]).strftime('%F')
    @sunrise = Time.at(weather_info[:sunrise]).strftime('%F %T %:z')
    @sunset = Time.at(weather_info[:sunset]).strftime('%F %T %:z')
    @min_temp = weather_info[:temp][:min]
    @max_temp = weather_info[:temp][:max]
    @conditions = weather_info[:weather][0][:description]
    @icon = weather_info[:weather][0][:icon]
  end
end