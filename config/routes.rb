Rails.application.routes.draw do
  
  get "/games/:id", to: "games#show"
  patch "/games/:id", to: "games#update"

  get "/users", to: "users#index"
  post "/users", to: "users#create"
  get "/users/:id/nextgame/:name", to: "users#nextgame"

  # resources :games
  # resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
