
Rails.application.routes.draw do
  get 'bookmarks/index'
  get 'bookmarks/create'
  get 'pdf/show'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :clubs do 
    resources :donations, only: [ :new, :create]
    resources :articles, only: [ :new, :create ]
    resources :bookmarks, only: [ :new, :create, :destroy ]
  end
  resources :donations, only: :show do
    resources :payments, only: :new
  end
  resources :species, only: [ :show ]
  resources :articles, only: [:index, :show, :destroy ]
  # resources :users, only: [:show]
  get 'profile', to: "users#show"
end
