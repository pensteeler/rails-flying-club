Rails.application.routes.draw do

  get '/login' => "sessions#new"
  post '/sessions' => "sessions#create"
  get '/logout' => "sessions#destroy"

  #get 'sessions/new'
  #get 'sessions/create'
  #get 'sessions/destroy'
  #resources :sessions, :only => [:new, :create, :destroy]

  #get '/users/new' => "users#new"
  #post '/users' => "users#create"
  resources :users, :only => [:new, :show, :create]

  # Will change later
  #root '/login'

  # Sample nested resources
  #resources :lists do
  #  resources :items
  #end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
