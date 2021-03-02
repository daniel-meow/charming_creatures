Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :clubs, only: [ :show, :index] do 
    resources :donations, only: [ :new, :create]
  end
  resources :donations, only: [ :show ]
  resources :species, only: [ :show ]
end
