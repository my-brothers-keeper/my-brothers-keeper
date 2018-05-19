Rails.application.routes.draw do

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  get '/signup' => 'users#new'
  get 'admin' => 'admin/organizations#show'
  

  root to: 'map#index'

  resources :organizations, only: [:index, :show]

  resources :users, only: [:new, :create]

  namespace :admin do
    resource :organization, only: [:show]
    resources :user_invitations, only: [:new, :create]

    resources :needs, only: [:edit, :update] do
      patch :enable
      patch :disable
    end
  end 
end
