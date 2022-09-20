Rails.application.routes.draw do
  resources :user_places
  resources :user_services
  root 'welcome#index'
  get 'policy/index'
  get 'terms/index'
  get 'home', to: 'homepage#index'
  get 'chatroom/index'
  post 'message', to: 'messages#create' 
  devise_for :users, controllers: { registrations: 'registrations/registrations' }
  resources :services
  resources :users, only: [:show, :index,:update]

  mount ActionCable.server, at: '/cable'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
