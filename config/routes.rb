Rails.application.routes.draw do

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "blogs#index"

  resources :users, only: [:index, :show, :new, :create]
  resources :logins, only: [:new, :create, :destroy]
  resources :blogs, only: [:index, :create, :new]

  namespace :api do
    resources :blogs, only: [:index]
    resources :register, only: [:create]
    resources :get_credentials, only: [:create]
    resources :get_renew_auth_token, only: [:create]
  end
end
