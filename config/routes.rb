Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users
      resources :sessions
      resources :subscriptions
      get 'users/:id/subscriptions', to: 'usersubscriptions#users_subscriptions'
      post 'users/:id/subscriptions/:subscription_id', to: 'usersubscriptions#add_subscription'
      delete 'users/:id/subscriptions/:subscription_id', to: 'usersubscriptions#delete_subscription'
    end
  end
end

# link that is incoming and to the actual action