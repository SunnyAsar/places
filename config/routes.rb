Rails.application.routes.draw do
  get 'likes/create'
  get 'likes/destroy'
  get 'comments/create'
  get 'comments/destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  resources :categories
  resources :activities

  post '/auth/login', to: 'authentication#login'
  get '/*a', to: 'application#not_found'
end
