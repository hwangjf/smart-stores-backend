class Api::V1::SessionsController < ApplicationController
  
  def refresh
    decoded_token = JWT.decode authorization_token(), secret_key(), true, { algorithm: 'HS256' }
    @user = User.find(decoded_token[0]["id"])

    render json: {
      username: @user.username,
      id: @user.id,
      user_subscriptions: @user.subscriptions
    }
  end

  def create
    @user = User.find_by(username: params["username"])
    
    if (@user && @user.authenticate(params["password"]))

      render json: {
        username: @user.username,
        id: @user.id,
        token: get_token(payload(@user.username, @user.id))
      }
    else
      render json: {
        errors: "user name or password is incorrect"
      }, status: :unauthorized
    end
  end

end