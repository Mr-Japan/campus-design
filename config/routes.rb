Rails.application.routes.draw do
  #resources :topics
  #get 'topics/new', to: "topics#new"
  #post "topics", to: "topics#create"
  
  get 'session/new'
  # get 'users/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#index'
  get 'pages/index'

  resources :users
  resources :sessions
  
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  get '/classworks',        to: 'classworks#home'
  get  '/classworks/index', to: 'classworks#index'
  get '/classworks/search', to: 'classworks#search'
  get  '/classworks/:id',   to: 'classworks#show'
  
  get '/classworks/:id/comments/new', to: 'comments#new', as:'comments_new'
  get '/classworks/:id/comments',     to: 'comments#index', as:'comments_index'
  
  
  #resources :classworks
end
