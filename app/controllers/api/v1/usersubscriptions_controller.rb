class Api::V1::UsersubscriptionsController < ApplicationController
  # before_action :requires_login, only: [:users_subscriptions, :add_subscription, :delete_subscription]
  
  def users_subscriptions
    @user = User.find_by(id: params[:id])
    render json: @user.subscriptions
  end

  def add_subscription
    @user = User.find_by(id: params[:id])
    @subscription = Subscription.find_by(id: params[:subscription_id])
  
    @user.subscriptions << @subscription
  end

  def delete_subscription
    @user = User.find_by(id: params[:id])
    @subscription = Subscription.find_by(id: params[:subscription_id])
  
    @user.subscriptions.delete(@subscription)
  end

  private
  # def subscriptions_params
  #   params.permit(:name, :info)
  # end
end

# User.find(id: params[:id]).subscriptions.delete(id=146)