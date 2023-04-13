Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :customers, only: [] do
        resources :subscriptions, only: %i[create index update], module: :customers
      end
    end
  end
end
