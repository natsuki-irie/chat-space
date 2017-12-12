Rails.application.routes.draw do
  resources :products
  devise_for :users
  # root 'users#edit'
  # root 'messages#index'
  root 'groups#index'
  resources :users, only: [:index, :edit, :update]
  resources :groups, only: [:index, :new, :create, :show, :edit, :update] do
    resources :messages, only: [:index, :new, :create]
  end
end