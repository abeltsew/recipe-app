Rails.application.routes.draw do
  devise_for :users

  resources :foods, expect: [:update]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

  get '/public_recipies', to: 'recipies#public_recipies'
  root 'recipies#public_recipies'
end
