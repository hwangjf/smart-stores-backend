require 'open-uri'

news_api_key = ENV['NEWS_API_KEY']

class Api::V1::NewsController < ApplicationController

  url = 'https://newsapi.org/v2/everything?'\
        # 'q=Apple&'\
        # 'from=2018-07-23&'\
        'sortBy=popularity&'\
        `apiKey=#{news_api_key}`
        req = open(url)
        
  response_body = req.read
  
  puts response_body
  
  def index
  end

  def create
  end

  private
  # def subscriptions_params
  # end
end



