Rails.application.routes.draw do
  
  root to: 'pages#home'
  get '/about', to: 'pages#about'
  get '/signup', to: 'users#new'
  resources :users, except: [:new]
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :goals do
    member do
      put 'like', to: "goals#upvote"
      put 'unlike', to: "goals#downvote"
    end
    resources :comments, except: [:index]
    resources :updates, except: [:index] do
      member do
        put 'like', to: "updates#upvote"
        put 'unlike', to: "updates#downvote"
      end
      resources :comments, except: [:index]
    end
  end
  resources :friendships

end