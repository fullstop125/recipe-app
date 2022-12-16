Rails.application.routes.draw do
  get 'public_lists/index'
  get 'recipes/index'
  devise_for :users
  root 'foods#index'
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

  # Defines routes for recipes
  resources :recipes, except: [:update]
  resources :public_lists, only: [:index]
  resources :foods, except: [:update]
end

