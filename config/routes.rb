Rails.application.routes.draw do
  root 'home#index'

  resources :events, only: [:create, :show]
  resources :home, only: [:index]
  resources :activities, only: [:create]
  resources :participants, only: [:create]
  resources :attendances, only: [:update]
end
