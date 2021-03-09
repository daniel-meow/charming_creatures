Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :clubs, only: [ :show, :index, :new, :create, :destroy] do 
    resources :donations, only: [ :new, :create]
    resources :articles, only: [ :new, :create ]
  end
  resources :donations, only: :show do
    resources :payments, only: :new
  end
  resources :articles, only: :destroy 
  resources :chatrooms, only: [ :index, :show ] do
    resources :messages, only: :create
  end
end