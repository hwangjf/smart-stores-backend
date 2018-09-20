class Api::V1::UsersubscriptionsController < ApplicationController
  before_action :requires_login

  def get_user_subscription_info
    @usersubscription = UserSubscription.find_by(user_id: params[:user_id], subscription_id: params[:subscription_id])

    render json: @usersubscription.attributes
  end

  def set_user_subscription_date
    @usersubscription = UserSubscription.find_by(user_id: params[:user_id], subscription_id: params[:subscription_id])
    date = JSON.parse(request.body.string)["date"]
    @usersubscription.update_columns(date: date)

    render json: @usersubscription.attributes
  end

  def set_user_subscription_cost
    @usersubscription = UserSubscription.find_by(user_id: params[:user_id], subscription_id: params[:subscription_id])
    cost = JSON.parse(request.body.string)["cost"]
    @usersubscription.update_columns(cost: cost)

    render json: @usersubscription.attributes
  end

  def users_subscriptions
    @usersubscriptions = UserSubscription.where(user_id: params[:user_id])

    render json: @usersubscriptions
  end

  def add_subscription
    @user = User.find_by(id: params[:user_id])
    @subscription = Subscription.find_by(id: params[:subscription_id])
  
    if !@user.subscriptions.include?(@subscription)
      @user.subscriptions << @subscription
    end

    @usersubscription = UserSubscription.find_by(user_id: params[:user_id], subscription_id: params[:subscription_id])
  
    render json: @usersubscription
  end

  def delete_subscription
    @usersubscription = UserSubscription.find_by(user_id: params[:user_id], subscription_id: params[:subscription_id])
    @user = User.find_by(id: params[:user_id])
    @subscription = Subscription.find_by(id: params[:subscription_id])
  
    @user.subscriptions.delete(@subscription)
    
    render json: @usersubscription
  end

  private

  def user_params
    params.permit(:user_id, :subscription_id)
  end
  
end

# User.find(id: params[:user_id]).subscriptions.delete(id=146)