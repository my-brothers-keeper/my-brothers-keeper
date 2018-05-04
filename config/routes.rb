Rails.application.routes.draw do


  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  get '/signup' => 'users#new'
  root to: 'users#index'

  resources :users, only: [:new, :create, :index]

  namespace :admin do
    resources :organizations, only: [:new, :create, :show] do
      resources :needs, only: [:new, :create]
    end
  end
end
