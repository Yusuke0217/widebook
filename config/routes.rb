Rails.application.routes.draw do

  root 'homes#index'
  get "/privacy", to: "users#privacy"
  get "/rule", to: "users#rule"
  get "/help", to: "users#help"
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  
  namespace :owner do 
    get "/signup", to: "owners#new"
    post "/signup", to: "owners#create"
    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"
    resources :shops, only: [:show], param: :owner_id
    resources :password_resets, only: [:new, :edit, :create, :update]
    resources :account_activations, only: [:edit]
  end

  resources :users, only: [:index, :show, :edit, :update, :destroy] do
    resource :bookmarks, only: [:show, :edit, :update]
    resource :reviews, only: [:show]
  end

  resources :shops, only: [:index, :new, :show, :edit, :create, :update, :destroy] do
    resource :bookmarks, only: [:create, :destroy]
    resource :reviews, only: [:show, :new, :create]
    resource :menus, only: [:show, :new, :edit, :create, :update, :destroy]
  end

  resources :owners, only: [:index, :show, :edit, :update, :destroy] do
    member do 
      resource :dashboards, only: [:show]
    end
  end

  resources :searchs, only: [:index, :show]
  resources :images, only: [:show]
  resources :bookmarks, only: [:index]
  resources :categories, only: [:index, :show]
  resources :areas, only: [:index, :show]
  resources :account_activations, only: [:edit]
  resources :purposes, only: [:show]
  resources :reviews, only: [:index, :edit, :update, :destroy]
  resources :password_resets, only: [:new, :edit, :create, :update]

end
