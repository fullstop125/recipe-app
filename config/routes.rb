Rails.application.routes.draw do
  get 'recipes/index'
  devise_for :users
  root 'foods#index'
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

  # Defines routes for recipes
  resources :recipes, except: [:update]
<<<<<<< HEAD
  get 'public_recipes', to: 'recipes#public', as: 'public_recipes'
=======
  resources :foods, except: [:update]
>>>>>>> aeffddc6c50d835065933ab43dc581a74d60bada
end

