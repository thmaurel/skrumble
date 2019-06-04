Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'dashboard', to: 'pages#dashboard'
  resources :trips, only: [:create, :show]
  resources :tripitems, only: [:update]
  resources :todos, only: [:update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
