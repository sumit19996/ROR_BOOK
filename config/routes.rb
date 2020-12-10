Rails.application.routes.draw do

	devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/home', to: 'users#index'
  get 'users/:id', to: 'users#profile', as: :profile
  get 'post/like/:post_id', to: 'likes#save_like', as: :like_post
  get '/add_friend', to: 'requests#add_friend'
  get '/friend_request', to: 'connections#friend_request'
  resources :posts
  resources :requests
  resources :connections
  root to: "public#index"
end
