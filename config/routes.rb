Rails.application.routes.draw do
  root "welcome#index"
  get '/search', to: "search#index"

  namespace :api do
    namespace :v1 do
      namespace :games do
        get '/:id', to: "games#show"
        post "/:id/plays", to: "play#create"
      end
    end
  end
end
