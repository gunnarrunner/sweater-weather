class RoadTrip
  attr_reader :time_info,
              :forecast_info
  def initialize(time_info, forecast_info)
    @time_info = time_info
    @forecast_info = forecast_info
    @time = time
    @forecast = forecast
  end

  def time
    if @time_info[:route][:formattedTime]
      @time_info[:route][:formattedTime]
    else
      "Impossible route"
    end
  end

  def forecast
    if @time == "Impossible route"
      'No Weather avaiable'
    else
      hours = @time[0..1].to_i
      @forecast_info[hours - 1]
    end
  end
end