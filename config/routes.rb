Rails.application.routes.draw do
  resources :cars do
    resources :test_drives
  end

  resources :test_drives

  resources :users, only: [:show, :new, :create] do
    resources :test_drives, only: [:index]
  end
  resources :catagories, only: [:show, :new, :create]

  root 'sessions#welcome'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'

end
