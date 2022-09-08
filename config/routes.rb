Rails.application.routes.draw do
  resources :user_places
  resources :user_services
  root 'welcome#index'
  get 'policy/index'
  get 'terms/index'
  get 'home', to: 'homepage#index'
  get 'chatroom/index'
  devise_for :users
  resources :services
  resources :users, only: [:show, :index,:update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
