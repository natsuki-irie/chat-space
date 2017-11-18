Rails.application.routes.draw do
  devise_for :users
  # root 'users#edit'
  root 'messages#index'
  # root '/users/sign_up'
  resources :users, only: [:edit, :update]
end