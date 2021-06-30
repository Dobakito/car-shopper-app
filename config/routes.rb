Rails.application.routes.draw do
  resources :cars do
    resources :test_drives, as: 'test_drive'
  end
  resources :test_drives, as: 'test_drive'
  resources :users, only: [:show, :new, :create]

  resources :sessions

  root 'sessions#welcome'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'session#destroy'
end
