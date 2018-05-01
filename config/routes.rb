Rails.application.routes.draw do

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  get '/signup' => 'users#new'
  get '/' => 'users#index'

  resources :users, only: [:new, :create, :index]

  namespace :admin do
    resources :organizations, only: [:show] do
      resources :needs, only: [:new, :create]
    end
  end
end
