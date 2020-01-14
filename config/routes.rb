Rails.application.routes.draw do
 
  # get 'reservations/index'
  # get 'reservations/create'
  # get 'reservations/search'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  get '/user', to: 'users#user'
  resources :categories
  resources :activities do
    resources :comments
  end
  resources :likes, only: [:create, :destroy]
  resources :reservations, only: [:create, :index, :search]

  post '/auth/login', to: 'authentication#login'
  # get '/*a', to: 'application#not_found'
end
