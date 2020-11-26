Rails.application.routes.draw do
  root 'homes#index'

  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  resources :users do
    resource :bookmarks, only: [:index, :show, :edit, :update]
  end

  resources :shops do
    resource :bookmarks, only: [:create, :destroy]
  end
  
  resources :categories, only: [:index, :create, :destroy]
  resources :areas
  resources :account_activations, only: [:edit]

end
