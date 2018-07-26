class Api::V1::SessionsController < ApplicationController
  def refresh
    decoded_token = JWT.decode authorization_token(), secret_key(), true, { algorithm: 'HS256' }
  
    render json: decoded_token[0]
    
    # byebug
    # begin
    #   username = JWT.decode authorization_token(), secret_key(), true, { algorithm: 'HS256' }[0].username
    #   user_id = JWT.decode authorization_token(), secret_key(), true, { algorithm: 'HS256' }[0].id
      
          
    #   if (@user && @user.authenticate(params["password"]))
    #     # payload = { name: params["username"], id: @user.id }

    #     render json: {
    #       username: @user.username,
    #       id: @user.id,
    #       token: get_token(payload(@user.username, @user.id))
    #     }
    #   else
    #     render json: {
    #       errors: "Those credentials don't match anything we have in our database"
    #     }, status: :unauthorized
    #   end

    #   # if 
    #   #   render json: {
    #   #   username: @user.username,
    #   #   id: @user.id,
    #   #   token: get_token(payload(@user.username, @user.id))
    #   # }
    #   # end
    #   # Session.new.create
    #   # IS IT BETTER TO SAVE YOUR PASSWORD TO THE TOKEN AND SEND IT TO BACKEND OR IS IT BETTER TO JUST USE LOCAL STORAGE OR SHOULD I JUST MAKE IT OKAY BECAUSE YOU ARE TECHNICALLY AUTHORIZED WITH A TOKEN
    # rescue JWT::VerificationError, JWT::DecodeError
    #   nil
    # end
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