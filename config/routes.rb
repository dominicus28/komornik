Rails.application.routes.draw do
  resources :commitments
  resources :groupinfos
  resources :bills
  resources :users, only: [:create]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
