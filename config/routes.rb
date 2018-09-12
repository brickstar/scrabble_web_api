Rails.application.routes.draw do
  root "welcome#index"
  get '/search', to: "search#index"

  namespace :api do
    namespace :v1 do
      get "/game", to: "game#show"
      resources :games, only: [:show]
    end
  end
end
