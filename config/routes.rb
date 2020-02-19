#Routing

Rails.application.routes.draw do
  defaults format: :json do
    resources :users
    get '/user', to: 'users#user'
    resources :categories
    resources :activities do
      resources :comments
    end
    resources :likes, only: [:create, :destroy]
    resources :reservations do
      post 'complete_reservation', to: 'reservation#complete_reservation', as: 'complete_reservation'
    end

    post '/auth/login', to: 'authentication#login'
    # get '/*a', to: 'application#not_found'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  end
