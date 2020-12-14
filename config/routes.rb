Rails.application.routes.draw do

	devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/home', to: 'users#index'
  get 'users/:id', to: 'users#profile', as: :profile
  get '/add_friend', to: 'requests#add_friend'
  get '/friend_request', to: 'connections#friend_request'
  resources :posts do
    resources :comments
    resources :likes
  end
  resources :requests
  resources :connections
  root to: "public#index"
end
