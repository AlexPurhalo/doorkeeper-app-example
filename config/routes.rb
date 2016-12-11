Rails.application.routes.draw do
  use_doorkeeper
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#index'
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create]
  delete '/logout', to: 'sessions#destroy', as: :logout

  namespace :api do
    get 'user', to: 'users#show'
    get 'user/update', to: 'users#update'
  end
end
