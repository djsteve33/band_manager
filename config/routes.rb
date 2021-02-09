Rails.application.routes.draw do
  root "sessions#home"

  get '/signup', => 'users#new'
  post '/signup', => 'users#create'
  # get '/login', to: 'sessions#new'
  # post '/login', to: 'sessions#create'
  # delete '/logout', to: 'sessions#destroy'

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
