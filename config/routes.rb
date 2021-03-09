Rails.application.routes.draw do
  
  get "/games/:id", to: "games#show"
  patch "/games/:id", to: "games#update"

  get "/users" to: "user#index"
  post "/users" to: "user#create"

  # resources :games
  # resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
