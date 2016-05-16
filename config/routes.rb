Rails.application.routes.draw do
  root 'home#index'

  resources :events
  resources :home, only: [:index]
  resources :users
  resources :activities, only: [:create, :update, :destroy]
  resources :participants, only: [:create, :update, :destroy]
  resources :attendances, only: [:update]
end
