Rails.application.routes.draw do
  root 'homes#index'

  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  resources :users
  resources :shops
  resources :account_activations, only: [:edit]
end
