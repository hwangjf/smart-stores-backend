Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users
      resources :sessions
      resources :subscriptions
    end
  end
end

# link that is incoming and to the actual action