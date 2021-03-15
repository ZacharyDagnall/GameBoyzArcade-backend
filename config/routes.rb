Rails.application.routes.draw do
  
  root to: "welcome#link"

  get "/games/:id", to: "games#show"
  patch "/games/:id", to: "games#update"
  get "/games/:name/leaderboard", to: "games#leaderboard"
  delete "/games/:id", to: "games#destroy"
  get "/games/rules/:name", to: "games#rules"

  get "/users", to: "users#index"
  post "/users", to: "users#create"
  get "/users/:id/nextgame/:name", to: "users#nextgame"
  get "/users/:id/scores", to: "users#scores" 

  # resources :games
  # resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
