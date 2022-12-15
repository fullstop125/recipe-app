Rails.application.routes.draw do
  get 'recipes/index'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'recipes#index'

  # Defines routes for recipes
  resources :recipes, except: [:update]
  get 'public_recipes', to: 'recipes#public', as: 'public_recipes'
end

