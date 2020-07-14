# frozen_string_literal: true

Rails.application.routes.draw do
  resources :users
  resources :items
  resources :skills
  resources :trade_request_skills
  resources :trade_requests
  resources :trade_request_items

  get '/users/:id/goods', to: 'users#user_goods'

  get '/users_partners/:id', to: 'users#user_partners'

  post '/trade_requests', to: 'trade_requests#create'

  get '/trade_requests/:id/goods/:user', to: 'trade_requests#goods'

  get '/trade_requests_user/:id', to: 'trade_requests#user_trades'

  post '/trade_request_items', to: 'trade_request_items#create'
  delete '/trade_request_items/:id', to: 'trade_request_items#destroy'
  patch '/trade_request_items/:id', to: 'trade_request_items#update'

  post '/trade_request_skills', to: 'trade_request_skills#create'
  delete '/trade_request_skills/:id', to: 'trade_request_skills#destroy'
  patch '/trade_request_skills/:id', to: 'trade_request_skills#update'

  post '/login', to: 'users#login'
  post '/signup', to: 'users#create'
end
