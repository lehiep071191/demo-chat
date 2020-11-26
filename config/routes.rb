Rails.application.routes.draw do
  get 'posts/new'
  get 'posts/show'
  root 'pages#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users 
  resources :posts do
    resources :comments
  end

 	
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
