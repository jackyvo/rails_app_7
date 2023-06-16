Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post "/login", to: "sessions#create"

      resources :brands, only: [:create] do
        resources :products, only: [:destroy, :create, :update]
      end
    end
  end
end
