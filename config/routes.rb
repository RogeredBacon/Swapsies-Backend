# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  resources :items
  resources :skills
  resources :trade_request_skills
  resources :trade_requests
  resources :trade_request_items

  get '/users/:id/goods', to: 'users#user_goods'

  post '/trade_requests', to: 'trade_requests#create'

  post '/trade_request_items', to: 'trade_request_items#create'

  post '/goods_and_services', to: 'goods_and_services#create'

  post '/login', to: 'users#login'
  post '/signup', to: 'users#create'
end
