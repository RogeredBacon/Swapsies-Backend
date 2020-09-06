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
  patch '/trade_requests/:id/status/:user', to: 'trade_requests#status'
  patch '/trade_requests/:id/status-committed', to: 'trade_requests#status_committed'
  patch '/trade_requests/:id/commit/:user/:toggle', to: 'trade_requests#commit'

  get '/trade_requests/:id/goods/:user', to: 'trade_requests#goods'

  get '/trade_requests_user/:id', to: 'trade_requests#user_trades'

  post '/trade_request_items', to: 'trade_request_items#create'
  delete '/trade_request_items/:item_id/:trade_request_id', to: 'trade_request_items#destroy'
  patch '/trade_request_items', to: 'trade_request_items#update'

  post '/trade_request_skills', to: 'trade_request_skills#create'
  delete '/trade_request_skills/:skill_id/:trade_request_id', to: 'trade_request_skills#destroy'
  patch '/trade_request_skills', to: 'trade_request_skills#update'

  post '/login', to: 'users#login'
  post '/signup', to: 'users#create'
end
