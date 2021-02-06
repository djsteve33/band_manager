Rails.application.routes.draw do
  # get '/signup', to: 'users#new'
  # get '/login', to: 'sessions#new'
  # post '/login', to: 'sessions#create'
  # delete '/logout', to: 'sessions#destroy'

  # resources :concerts, only: [:create, :update, :show, :index, :new]
  # resources :users
  # resources :venues, only: [:show, :index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # get '/concerts', to: 'concerts#index'
  # post '/concerts', to: 'concerts#create'
  # get '/concert/new', to: 'concerts#new'
  # get '/concerts/show', to: 'concerts#show'

  # get '/sessions/new', to: 'sessions#new'

  # get '/venue/new', to: 'venues#new'

  resources :venues do
    resources :concerts
  end
end
