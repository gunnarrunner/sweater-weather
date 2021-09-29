class Api::V1::RoadTripController < ApplicationController
  # def index
  
  # end

  # def show
    
  # end
  # def new
    
  # end

  def create
    # require "pry"; binding.pry
    user = User.find_by(api_key: params[:api_key])
    if user && params[:origin].present? && params[:destination].present?
      road_trip = RoadTripFacade.destination_info(params[:origin], params[:destination])
      render json: RoadTripSerializer.road_trip_info(params[:origin], params[:destination], road_trip)
    elsif !params[:origin].present? || !params[:destination].present?
      render :json => { :errors => 'Invalid Locations' }, :status => 400
    else
      render :json => { :errors => 'Not authorized' }, :status => 401
    end
  end

  # def edit
    
  # end
  # def update
    
  # end
  # def destroy
    
  # end
  
# private
  # def user_params
  #   params.permit(:email, :password)
  # end
end