require 'open-uri'
require 'uri'

class Api::V1::NewsController < ApplicationController
  
  def news_api_key 
    ENV['NEWS_API_KEY']
  end
  
  def get_news
    url = ("https://newsapi.org/v2/everything?"\
          "q=#{URI.encode(params[:term])}&"\
          "sortBy=relevancy&"\
          "language=en&"\
          "page=#{params[:pg]}&"\
          "apiKey=#{news_api_key()}")

    puts url

    req = open(url)
    response_body = req.read
    
    render json: response_body
  end

  def create
  end

end



