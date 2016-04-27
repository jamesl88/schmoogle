Rails.application.routes.draw do
  root 'home#index'

  resources :events
  resources :home, only: [:index]
  resources :users
  resources :activities
  resources :participants, only: [:create, :update, :destroy]
  resources :attendances, only: [:update]
end
