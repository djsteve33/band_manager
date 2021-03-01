Rails.application.routes.draw do
  root 'sessions#welcome'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  #get '/users/:id', to: 'users#show', as 'user'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  

  delete '/logout', to: 'sessions#destroy'

  get '/auth/google_oauth2/callback', to: 'sessions#omniauth'

   resources :users, only: [:new, :show, :create]
  #resources :venues
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # get '/concerts', to: 'concerts#index'
  # post '/concerts', to: 'concerts#create'
  # get '/concert/new', to: 'concerts#new'
  # get '/concerts/show', to: 'concerts#show'

  # get '/sessions/new', to: 'sessions#new'

  # get '/venue/new', to: 'venues#new'

  #resources :concerts, only: [:index, :new, :create, :show, :edit, :update, :destroy]

  resources :venues do
    resources :concerts, shallow: true
  end
 
end
