class Api::V1::UsersubscriptionsController < ApplicationController
  before_action :requires_login
  
  def set_user_subscription_date
    @usersubscription = UserSubscription.find_by(user_id: params[:id], subscription_id: params[:subscription_id])
    date = JSON.parse(request.body.string)["date"]
    @usersubscription.update(date: date)
  end

  def set_user_subscription_cost
    @usersubscription = UserSubscription.find_by(user_id: params[:id], subscription_id: params[:subscription_id])
    cost = JSON.parse(request.body.string)["cost"]
    @usersubscription.update(cost: cost)
  end

  def users_subscriptions
    @user = User.find_by(id: params[:id])
    render json: @user.subscriptions
  end

  def add_subscription
    @user = User.find_by(id: params[:id])
    @subscription = Subscription.find_by(id: params[:subscription_id])
  
    if !@user.subscriptions.include?(@subscription)
      @user.subscriptions << @subscription
    end
    render json: @subscription
  end

  def delete_subscription
    @user = User.find_by(id: params[:id])
    @subscription = Subscription.find_by(id: params[:subscription_id])
  
    @user.subscriptions.delete(@subscription)
    render json: @subscription
  end
end

# User.find(id: params[:id]).subscriptions.delete(id=146)