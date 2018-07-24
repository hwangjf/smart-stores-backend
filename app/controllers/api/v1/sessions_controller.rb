class Api::V1::SessionsController < ApplicationController

  def index
    @sessions = Session.all
    render json: @sessions
  end
  
  def show
    
  end  

  def create
    @user = User.find_by(username: params["username"])
    
    if (@user && @user.authenticate(params["password"]))
      # payload = { name: params["username"], id: @user.id }

      render json: {
        username: @user.username,
        id: @user.id,
        token: get_token(payload(@user.username, @user.id))
      }
    else
      render json: {
        errors: "Those credentials don't match anything we have in our database"
      }, status: :unauthorized
    end
  end

end