Rails.application.routes.draw do
  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

  get "/", to: "articles#index"

  get "/login.html", to: "articles#login"

  get "/signup", to: "users#new"

  get "/login", to: "users#login"

  resources :users, only: [:new, :create, :update, :edit, :destroy, :show, :index, :login]

  get "/welcome", to: "articles#welcome"

  # post "/login", to: "articles#welcome"

  # post "userinfo", to: ""
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

