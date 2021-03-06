Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users

  root to: 'pages#home'
    
  get 'dashboard', to: 'dashboard#index'
  resources :profiles, only: :update
    
  resources :boats do
    resources :bookings, only: [ :new, :create ]
    resources :reviews, only: [ :new, :create ]
  end

  resources :bookings, only: [ :show ]

  resources :conversations do
    resources :messages, only: [ :index, :new, :create ]

  end
end
