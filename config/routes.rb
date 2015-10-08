Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'event_planner#index'

  resources :event_planner, except: [:index]
  resources :users
  resources :activities
  resources :participants, only: [:update]
end
