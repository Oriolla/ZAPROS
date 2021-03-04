Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'welcome#index'


  resources :nirs
  match 'requests/destroy_all',    to: 'requests#destroy_all',          via: 'get'
  match 'requests/epsh',    to: 'requests#epsh',          via: 'get'
  resources :two_criteria
  resources :requests
  resources :assessments
  resources :criteria
  resources :universities
  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'

  match 'ask',                     to: 'ask#index',                     via: 'get'
  match 'ask/update_request',      to: 'ask#update_request',            via: 'get'


end
