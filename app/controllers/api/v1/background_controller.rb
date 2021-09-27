class Api::V1::BackgroundController < ApplicationController
  def index
   if params[:location]
      background = UnsplashFacade.background(params[:location])
      render json: UnsplashSerializer.photo_information(background)
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