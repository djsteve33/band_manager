Rails.application.routes.draw do
  resources :concerts, only: [:create, :update, :show, :index, :new]
  resources :users
  resources :venues, only: [:show, :index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/new', to: 'concerts#new'
end
