class Api::V1::UsersController < ApplicationController
  # def index
  #   if params[:location]
  #     lat = GeocodeFacade.location(params[:location])[0].latitude
  #     long = GeocodeFacade.location(params[:location])[0].longitude
  #     forecast = WeatherFacade.forecast(lat, long)
  #     render json: ForecastSerializer.new(forecast)
  #   else
  #     render :json => { :errors => 'Invalid Location' }, :status => 400
  #   end
  # end

  # def show
    
  # end
  # def new
    
  # end

  def create
    user = User.new(user_params)

    if user.save
      api_key = SecureRandom.hex(25)
      user.update(api_key: api_key)
      render json: UsersSerializer.return_user(user), status: 201
    else
      render :json => { :errors => 'Invalid email or password' }, :status => 409
    end
  end

  # def edit
    
  # end
  # def update
    
  # end
  # def destroy
    
  # end
  
private
  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end