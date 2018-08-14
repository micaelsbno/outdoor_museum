Rails.application.routes.draw do
  resources :users_pictures
  resources :comments
  resources :pictures
  resources :users
  resources :search, only: [:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
