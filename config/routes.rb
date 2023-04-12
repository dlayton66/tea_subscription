Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :customers, only: [] do
        post '/subscriptions/:subscription_id', to: 'customer/subscriptions#create', as: 'subscription'
        resources :subscriptions, only: %i[index destroy], controller: 'customer/subscriptions'
      end
    end
  end
end
