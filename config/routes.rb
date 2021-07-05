Rails.application.routes.draw do
  resources :cars do
    resources :test_drives
  end

  resources :test_drives

  resources :users, only: [:show, :new, :create] do
    resources :test_drives, only: [:index]
  end
  resources :categories

  get '/cars/order_by_rating' => 'cars#index'
  root 'sessions#welcome'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'

  get '/auth/google_oauth2/callback' => 'sessions#google_create'
end
