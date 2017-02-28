Rails.application.routes.draw do


  devise_for :users

  resources :chatrooms do
    resource :chatroom_users
  end


  resources :pins do
    member do
      put "like", to: "pins#upvote"
    end
  end


  root 'pins#index'
  get '/chatrooms', to: 'chatrooms#index'





end
