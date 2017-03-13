require 'sidekiq/web'
Rails.application.routes.draw do


  get 'welcome/index'

  resources :classrooms

  get '/teachers/new' => 'classrooms#new'

  get 'teachers/show' => 'classrooms#show'


  get '/user/:id' => 'pins#profile'
  get '/teachers/:id' => 'teachers#profile'
  get '/educators' => 'classrooms#all'
  get '/members' => 'pins#all'
  get 'category/:id' => 'pins#category'



resources :conversations do
  resources :sends
end

  resources :notifications do
    collection do
      post :mark_as_read
    end
  end



  devise_for :users do

  end

  resources :teachers



  resources :chatrooms do
    resource :chatroom_users
    resources :messages
  end

  resources :pins do
    resources :comments
    member do
      put "like", to: "pins#upvote"
    end
  end




  get '/chatrooms', to: 'chatrooms#index'




  mount Sidekiq::Web => '/sidekiq'

end
