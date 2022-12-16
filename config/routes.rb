Rails.application.routes.draw do

  devise_for :users
  root 'foods#index'
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

  # Defines routes for recipes
  resources :recipes do
    resources :recipe_foods, only: [:create, :destroy, :update, :new]
  end
  resources :public_lists, only: [:index]
  resources :shopping_list, only: [:index]
 
  resources :foods, except: [:update]
end

