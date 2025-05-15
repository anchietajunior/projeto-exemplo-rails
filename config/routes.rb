Rails.application.routes.draw do
  resources :carts
  resource :session
  resources :passwords, param: :token
  resources :products do
    collection do
      get :report
    end
  end
  resources :categories
  resources :users

  get "up" => "rails/health#show", as: :rails_health_check

  root "products#index"
end
