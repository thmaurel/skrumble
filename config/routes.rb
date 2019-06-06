Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'dashboard', to: 'pages#dashboard'
  resources :trips, only: [:create, :show, :share_new, :share_create]
  resources :tripitems, only: [:update] do
    patch :mark_as_complete, on: :member
  end
  resources :todos, only: [:update] do
    patch :mark_as_complete, on: :member
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
