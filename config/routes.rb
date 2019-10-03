Rails.application.routes.draw do
 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  resources :categories
  resources :activities
  resources :likes, only: [:create, :destroy]
  resources :comments, only: [:create, :update, :destroy]

  post '/auth/login', to: 'authentication#login'
  get '/*a', to: 'application#not_found'
end
