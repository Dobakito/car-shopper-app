Rails.application.routes.draw do

  resources :cars do
    resources :test_drives, shallow: true
  end

  get '/cars_order_by_rating' => 'cars#order'

  resources :test_drives, only: [:new]

  resources :users, only: [:show, :new, :create] do
    resources :cars, only: [:index]
  end

  resources :categories

  root 'sessions#welcome'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'

  get '/auth/google_oauth2/callback' => 'sessions#google_create'
end
