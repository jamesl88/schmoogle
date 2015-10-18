Rails.application.routes.draw do
  root 'event_planner#index'

  resources :event_planner, only: [:index]
  resources :users
  resources :activities
  resources :participants, only: [:update]
end
