Rails.application.routes.draw do
  root 'homes#index'

  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  resources :users do
    resource :bookmarks, only: [:index, :show, :edit, :update]
    resource :reviews, only: [:show]
  end

  resources :shops do
    resource :bookmarks, only: [:create, :destroy]
    resource :reviews, only: [:show, :new]
  end

  resources :searchs, only: [:index]
  
  resources :categories, only: [:index, :show, :create, :destroy]
  resources :areas, only: [:show]
  resources :account_activations, only: [:edit]
  resources :bussiness_types, only: [:show]
  resources :reviews, only: [:index, :create, :edit, :update, :destroy]

end
