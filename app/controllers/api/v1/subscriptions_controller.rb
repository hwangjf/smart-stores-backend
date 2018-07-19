class Api::V1::SubscriptionsController < ApplicationController
  before_action :requires_login

  def index
    subscriptions = Subscriptions.all
    render json: subscriptions
  end

  def create
    subscriptions = Subscriptions.create(subscriptions_params)
    render json: subscriptions
  end

  private
  def subscriptions_params
    params.permit(:name)
  end
end

# class SnacksController < ApplicationController
  # before_action :requires_login, only: [:index]

#   def index
#     render json: Snack.all
#   end

# end