require 'clearbit'
subscription_api_key = ENV['SUBSCRIPTION_API_KEY']
Clearbit.key = subscription_api_key

class Api::V1::SubscriptionsController < ApplicationController
  # before_action :requires_login, only: [create]

  def index
    @subscriptions = Subscription.all
    render json: @subscriptions
  end

  def create
    company = Clearbit::Enrichment::Company.find(domain: JSON.parse(request.body.string)["url"])
    
    if company && !company.pending?
      @subscription = Subscription.where(name: company["name"]).first_or_create(name: company["name"], info: company)
      
      render json: @subscription
    else
      render json: {
        status: "error", 
        code: 404, 
        message: "company could not be found"
      }
    end
  end

  private
  def subscriptions_params
    params.permit(:company_url, :info)
  end
end