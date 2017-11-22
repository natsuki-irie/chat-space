Rails.application.routes.draw do
  devise_for :users
  # root 'users#edit'
  root 'groups#index'
  resources :users, only: [:edit, :update]
  resources :groups, only: [:index, :new, :create, :show, :edit, :update]
end