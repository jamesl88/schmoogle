Rails.application.routes.draw do
  root 'event_planner#index'

  resources :event_planner, only: [:index]
  resources :users
  resources :activities

  #api
  namespace :api do
    namespace :v1 do
      resources :participants, only: [:update]
    end
  end
end
