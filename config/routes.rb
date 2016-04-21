Rails.application.routes.draw do
  root 'home#index'

  resources :events
  resources :home, only: [:index]
  resources :users
  resources :activities
  resources :participants, only: [:create, :update, :destroy]

  #api
  namespace :api do
    namespace :v1 do
      resources :participants, only: [:update]
    end
  end
end
