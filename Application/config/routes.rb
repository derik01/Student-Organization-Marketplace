Rails.application.routes.draw do
  resources :members
  resources :products
  get 'sign_in', to: 'sessions#new'
  post 'sign_in', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get "/", to: "articles#index"

  get "/signup_organization", to: "users#new"
  get "/signup_member", to: "members#new"

  resources :users, only: [:new, :create, :update, :edit, :destroy, :show, :index]

  get "/welcome", to: "articles#welcome"

  get "/marketplace", to: "products#marketplace"

  get "/dashboard", to: "dashboards#dashboard"

  get "upload", to: "products#new"
  get "profile", to: "users#show"
  post "upload", to: "products#create"

  get 'editprofile', to: "users#edit"

  delete 'deleteprofile', to: "users#destroy"
  delete '/', to: "sessions#destroy"

  get "member_profile", to: "members#show"

  resources :articles
  resources :member
  # post "/login", to: "articles#welcome"

  # post "userinfo", to: ""
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

