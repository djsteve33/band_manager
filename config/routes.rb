Rails.application.routes.draw do
  resources :concerts
  resources :users
  resources :venues
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
