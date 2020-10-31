Rails.application.routes.draw do
  root 'shops#index'

  get "/signup", to: "users#new"
end
