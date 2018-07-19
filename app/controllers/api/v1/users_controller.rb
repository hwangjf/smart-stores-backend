class Api::V1::UsersController < ApplicationController
  before_action :requires_login, only: [:index, :show, :users_subscriptions]

  def index
    @users = User.all
    render json: @users
  end

  def show
    @user = User.find_by(id: params[:id])
    render json: @user
  end

  def create
    @user = User.new

    @user.username = params[:username]
    @user.password = params[:password]

    if (@user.save)
      render json: {
        username: @user.username,
        id: @user.id,
        token: get_token(payload(@user.username, @user.id))
      }
    else
      render json: {
        errors: @user.errors.full_messages
      }, status: :unprocessable_entity
    end
  end

  def users_subscriptions
    @user = User.find_by(id: params[:user_id])

    render json: @user.subscriptions
  end

  private
  def user_params
    params.permit(:username,:password)
  end
end
