class Api::V1::ForecastController < ApplicationController
  def index
    if params[:location]
      lat = GeocodeFacade.location(params[:location])[0].latitude
      long = GeocodeFacade.location(params[:location])[0].longitude
    else
      json_error_response('Invalid Location', :bad_request)
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