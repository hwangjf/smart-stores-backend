Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users
      resources :sessions
      resources :subscriptions
      get 'users/:id/subscriptions', to: 'usersubscriptions#users_subscriptions'
      post 'users/:id/subscriptions/:subscription_id', to: 'usersubscriptions#add_subscription'
      delete 'users/:id/subscriptions/:subscription_id', to: 'usersubscriptions#delete_subscription'
      get 'refresh', to: 'sessions#refresh'
      get 'news/search/:term/:pg', to: 'news#get_news'
      post 'users/:id/subscriptions/:subscription_id/date', to: 'usersubscriptions#set_user_subscription_date'
      post 'users/:id/subscriptions/:subscription_id/cost', to: 'usersubscriptions#set_user_subscription_cost'
    end
  end
end

# link that is incoming and to the actual action