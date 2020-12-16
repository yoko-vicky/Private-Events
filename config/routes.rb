Rails.application.routes.draw do
  root 'users#index'
  resources :users, only: %i[new create show index]
  get 'sign_in', to: 'sessions#new'
  post 'sign_in', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
