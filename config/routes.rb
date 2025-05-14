Rails.application.routes.draw do
  resource :session
  resources :passwords, param: :token
  resources :products
  resources :categories

  get "up" => "rails/health#show", as: :rails_health_check

  root "products#index"
end
