Rails.application.routes.draw do

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  get '/signup' => 'users#new'
  get 'users' => 'admin/organizations#show'
  

  root to: 'map#index'

  resources :organizations, only: [:index, :show]

  resources :users, only: [:new, :create]

  namespace :admin do
    resources :organizations, only: [:show]

    resources :needs, only: [:edit, :update] do
      patch :enable
      patch :disable
    end
  end

  
end
