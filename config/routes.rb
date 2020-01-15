Rails.application.routes.draw do
  get '/api/v1/user/:id', to: 'api/v1/users#show'
  get '/api/v1/user/:id/ingredients', to: 'api/v1/users#ingredients'
  post '/api/v1/user/:id/ingredients', to: 'api/v1/users#add_ingredients'
  resources :users, except: [:edit, :update, :destroy] # includes index, new, create, show
  resources :user_ingredient
  resources :ingredients
end
