Rails.application.routes.draw do
  root 'events#index'
  resources :users, only: %i[new create show index]
  resources :events, except: %i[edit update destroy] do
    resources :invites, only: %i[create]   
  end
  get 'sign_in', to: 'sessions#new'
  post 'sign_in', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  # post 'invite', to: 'invites#create'
end
