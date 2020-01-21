Rails.application.routes.draw do
  get '/api/v1/user/:id', to: 'api/v1/users#show'
  get '/api/v1/user/:id/ingredients', to: 'api/v1/users#ingredients'
  post '/api/v1/user/:id/ingredients', to: 'api/v1/users#add_ingredient'
  patch '/api/v1/user/:user_id/ingredients/:ing_id', to: 'api/v1/users#change_quantity'
  delete '/api/v1/user/:user_id/ingredients/:ing_id', to: 'api/v1/users#delete_ingredient'
  resources :users, except: [:edit, :update, :destroy] # includes index, new, create, show
  resources :user_ingredient
  resources :ingredients
end
