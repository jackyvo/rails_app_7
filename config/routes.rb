Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post "/login", to: "sessions#create"

      resources :brands, only: [:create, :update] do
        resources :products, only: [:destroy, :create, :update]
      end

      resources :clients, only: :create
      resources :clients_products, only: :create
    end
  end
end
