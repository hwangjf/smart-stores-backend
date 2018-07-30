require 'open-uri'

class Api::V1::NewsController < ApplicationController
  
  def news_api_key 
    ENV['NEWS_API_KEY']
  end
  
  def get_news

    url = ("https://newsapi.org/v2/everything?"\
          "q=#{params[:term]}&"\
          "from=2018-01-01&"\
          "sortBy=relevancy&"\
          "language=en&"\
          "page=#{params[:pg]}&"\
          "apiKey=#{news_api_key()}")
    
    req = open(url)
    
    response_body = req.read
    render json: response_body

  end

  def create
  end

  private
  # def subscriptions_params
  # end
end



