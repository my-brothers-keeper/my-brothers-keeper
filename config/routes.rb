Rails.application.routes.draw do


  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  get '/signup' => 'users#new'
  root to: 'users#index'

  resources :users, only: [:new, :create, :index]

  namespace :admin do
    resources :organizations, only: [:show]

    resources :needs, only: [:edit, :update] do
      patch :enable
      patch :disable
    end
  end
end
