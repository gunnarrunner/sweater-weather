class Api::V1::SessionsController < ApplicationController
  # def index

  # end

  # def show
    
  # end
  # def new
    
  # end

  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      render json: SessionsSerializer.return_session(user), status: 200
    else
      render :json => { :errors => 'Invalid email or password' }, :status => 401
    end
  end

  # def edit
    
  # end
  # def update
    
  # end
  # def destroy
    
  # end
  
# private
#   def user_params
#     params.permit(:email, :password)
#   end
end