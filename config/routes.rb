Rails.application.routes.draw do
  get '/signup', to: 'users#new'
  get '/login', to: 'sesdsions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :concerts, only: [:create, :update, :show, :index, :new]
  resources :users
  resources :venues, only: [:show, :index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/concert/new', to: 'concerts#new'
  get '/show', to: 'concerts#show'

  resources :concerts do
    resources :venues
  end
end
