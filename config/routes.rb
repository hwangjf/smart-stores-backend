Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users do
        get 'subscriptions', to: 'users#users_subscriptions'
        post 'subscriptions/:subscription_id', to: 'users#add_subscription'
        delete 'subscriptions/:subscription_id', to: 'users#delete_subscription'
      end
      resources :sessions
      resources :subscriptions
    end
  end
end

# link that is incoming and to the actual action