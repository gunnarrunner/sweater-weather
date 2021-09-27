class Api::V1::ForecastController < ApplicationController
  def index
    if params[:location]
      lat = GeocodeFacade.location(params[:location])[0].latitude
      long = GeocodeFacade.location(params[:location])[0].longitude
      forecast = WeatherFacade.forecast(lat, long)
      render json: ForecastSerializer.new(forecast)
    else
      render :json => { :errors => 'Invalid Location' }, :status => 400
    end
  end

  # def show
    
  # end
  # def new
    
  # end
  # def create
    
  # end
  # def edit
    
  # end
  # def update
    
  # end
  # def destroy
    
  # end
  
# private
#   def _params
#     params.permit(:)
#   end
end