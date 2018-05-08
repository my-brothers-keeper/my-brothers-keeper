Rails.application.routes.draw do

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  get '/signup' => 'users#new'
  root to: 'users#index'

  get '/map', to: 'map#index'

  resources :organizations, only: [:index, :show]

  resources :users, only: [:new, :create, :index]

  namespace :admin do
    resources :organizations, only: [:show] do
      resources :needs, only: [:new, :create]
    end
  end
end
