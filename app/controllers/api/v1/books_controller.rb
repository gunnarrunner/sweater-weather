class Api::V1::BooksController < ApplicationController
  def index
    if params[:location] && params[:quantity].to_i >= 0
      lat = GeocodeFacade.location(params[:location])[0].latitude
      long = GeocodeFacade.location(params[:location])[0].longitude
      forecast = WeatherFacade.current_weather(lat, long)
      books = LibraryFacade.books(params[:location], params[:quantity].to_i)
      render json: LibrarySerializer.book_information(forecast, params[:location], books)
    else
      render :json => { :errors => 'Invalid Location or Invalid quantity' }, :status => 400
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