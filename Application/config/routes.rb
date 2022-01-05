Rails.application.routes.draw do
  get 'sign_in', to: 'sessions#new'
  post 'sign_in', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get "/", to: "articles#index"

  get "/signup", to: "users#new"

  resources :users, only: [:new, :create, :update, :edit, :destroy, :show, :index]

  get "/welcome", to: "articles#welcome"

  delete '/', to: "sessions#destroy"
  # post "/login", to: "articles#welcome"

  # post "userinfo", to: ""
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

