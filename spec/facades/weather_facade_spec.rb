require 'rails_helper'

RSpec.describe WeatherFacade do
  before :each do
    
  end

  it 'can create a forecast for the current day', :vcr do
    weather = WeatherFacade.current_weather(39.738453, -104.984853)

    expect(weather).to be_an_instance_of(CurrentWeather)
    # expect(weather.uvi).to eq(0)
  end

  it 'can create a forecast for the next 5 days', :vcr do
    weather = WeatherFacade.daily_weather(39.738453, -104.984853)

    expect(weather[0]).to be_an_instance_of(DailyWeather)
    # expect(weather[0].icon).to eq('01d')
  end

  it 'can create a forecast for the mext 8 hours', :vcr do
    weather = WeatherFacade.hourly_weather(39.738453, -104.984853)

    expect(weather[0]).to be_an_instance_of(HourlyWeather)
    # expect(weather[0].icon).to eq('04n')
  end
end
