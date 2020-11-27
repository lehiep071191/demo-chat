Rails.application.routes.draw do
  get 'password_resets/new'
  get 'password_resets/edit'
  get 'posts/new'
  get 'posts/show'
  root 'pages#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :account_activations
  resources :posts do
    resources :comments
  end
  resources :password_resets, only: [:new, :create, :edit, :update]
 	resources :relationships, only: [:create, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
