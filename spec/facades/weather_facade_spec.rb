require 'rails_helper'

RSpec.describe WeatherFacade do
  before :each do
    
  end

  it 'can create a forecast for the current day', :vcr do
    weather = WeatherFacade.current_weather(39.738453, -104.984853)

    expect(weather).to be_an_instance_of(CurrentWeather)
  end

  it 'can create a forecast for the next 5 days', :vcr do
    weather = WeatherFacade.daily_weather(39.738453, -104.984853)

    expect(weather[0]).to be_an_instance_of(DailyWeather)
  end

  it 'can create a forecast for the mext 8 hours', :vcr do
    weather = WeatherFacade.hourly_weather(39.738453, -104.984853)

    expect(weather[0]).to be_an_instance_of(HourlyWeather)
  end

  it 'can create a hourly forecast for all 48 hours', :vcr do
    weather = WeatherFacade.forty_eight_hour_forecast(39.738453, -104.984853)

    expect(weather[0]).to be_an_instance_of(FullHourlyWeather)
    expect(weather.size).to eq(48)
  end
end
