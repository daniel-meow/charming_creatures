
Rails.application.routes.draw do
  get 'bookmarks/index'
  get 'bookmarks/create'
  get 'pdf/show'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :bookmarks, only: [:index]
  resources :clubs do

    resources :donations, only: [ :new, :create]
    resources :articles, only: [ :new, :create ]
    resources :bookmarks, only: [ :new, :create, :destroy ]
  end
  resources :donations, only: :show do
    resources :payments, only: :new
  end
  resources :articles, only: :destroy
  resources :chatrooms, only: [ :index, :show ] do
    resources :messages, only: :create
  end
  # resources :users, only: [:show]
  get 'profile', to: "users#show"
  post 'profile', to: "users#update_goal"
  get 'about', to: "pages#show"
end
