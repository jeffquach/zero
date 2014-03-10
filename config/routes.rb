Mindmeetup::Application.routes.draw do
  get "password_resets/create"
  get "password_resets/edit"
  get "password_resets/update"
  get "users/show"
  root 'users#home'

  resources :users do
    member do
      get :activate
      get :home
      get :infowindow
    end
  end

  resources :user_friendships         

  resources :meetups

  resources :invitees

  resources :password_resets

  match "logout", to: "sessions#destroy", via: "get"
  match "signup", to: "users#new", via: "get"
  match "login", to: "sessions#new", via: "get"

  resources :sessions
end
