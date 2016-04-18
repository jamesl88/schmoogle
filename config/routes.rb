Rails.application.routes.draw do
  root 'home#index'

  resources :event_planner, only: [:index]
  resources :home, only: [:index]
  resources :users
  resources :activities

  #api
  namespace :api do
    namespace :v1 do
      resources :participants, only: [:update]
    end
  end
end
