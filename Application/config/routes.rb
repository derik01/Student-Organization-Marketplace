Rails.application.routes.draw do
  get "/", to: "articles#index"

  get "/login.html", to: "articles#login"

  get "/signup.html", to: "articles#signup"

  # post "userinfo", to: ""
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

