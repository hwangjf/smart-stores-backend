class Api::V1::SubscriptionsController < ApplicationController

  def index
    @subscriptions = Subscription.all
    render json: @subscriptions
  end

  def create
    subscriptions = Subscription.create(subscriptions_params)
    render json: subscriptions
  end

  private
  def subscriptions_params
    params.permit(:name, :info)
  end
end