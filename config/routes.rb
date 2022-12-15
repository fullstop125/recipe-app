Rails.application.routes.draw do
  get 'recipes/index'
  devise_for :users
  root 'foods#index'
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'recipes#index'

  # Defines routes for recipes
  resources :recipes, except: [:update]
end

