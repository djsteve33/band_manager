Rails.application.routes.draw do
  root 'sessions#welcome'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  delete '/logout' => 'sessions#destroy'

  get '/auth/:provider/callback' => 'sessions#omniauth'

  resources :concerts
  resources :users
  resources :venues
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # get '/concerts', to: 'concerts#index'
  # post '/concerts', to: 'concerts#create'
  # get '/concert/new', to: 'concerts#new'
  # get '/concerts/show', to: 'concerts#show'

  # get '/sessions/new', to: 'sessions#new'

  # get '/venue/new', to: 'venues#new'

  # resources :venues do
  #   resources :concerts
  # end
end
