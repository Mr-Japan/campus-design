Rails.application.routes.draw do
  get 'topics/new'
  get 'session/new'
 # get 'users/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#index'
  get 'pages/index'

  resources :users
  
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  get '/classwork', to: 'classworks#classwork'
  
  resources :users
  resources :topics
end
