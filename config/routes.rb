Rails.application.routes.draw do
  
  root to: 'pages#home'
  get '/about', to: 'pages#about'
  get '/signup', to: 'users#new'
  resources :users, except: [:new]
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :goals do
    resources :updates, except: [:index]
  end
end
