Mindmeetup::Application.routes.draw do
  get "oauths/oauth"
  get "oauths/callback"
  get "password_resets/create"
  get "password_resets/edit"
  get "password_resets/update"

  post "oauth/callback" => "oauths#callback"
  get "oauth/callback" => "oauths#callback" # for use with Github
  get "oauth/:provider" => "oauths#oauth", :as => :auth_at_provider

  root 'users#home'

  resources :users do
    resources :reviews
    member do
      get :activate
      get :home
      get :infowindow
      get :edit_meetup_info
      get :tooltip
    end
  end

  resources :subjects 

  resources :topics
  
  resources :user_friendships do
    member do
      put :block
    end
  end


  resources :meetups do
    resources :comments, except: [:index,:show]
  end

  resources :invitees

  resources :password_resets

  match "logout", to: "sessions#destroy", via: "get"
  match "signup", to: "users#new", via: "get"
  match "login", to: "sessions#new", via: "get"

  resources :sessions
end
