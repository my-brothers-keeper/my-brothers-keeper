Rails.application.routes.draw do


  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  get '/signup' => 'users#new'
  root to: 'users#index'

  resources :users, only: [:new, :create, :index]

  namespace :admin do
    resources :organizations, only: [:show] do
      resources :needs, only: [:new, :create]
    end

    resources :needs, only: [] do
      patch :enable
      patch :disable
    end
  end
end
