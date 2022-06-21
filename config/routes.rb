Rails.application.routes.draw do
  root 'welcome#index'
  get 'policy/index'
  get 'terms/index'
  get 'home', to: 'homepage#index'
  devise_for :users
  resources :services, only: [:show, :index, :new, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
