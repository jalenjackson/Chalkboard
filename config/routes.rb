Rails.application.routes.draw do


  get 'posts/index'

  get 'posts/edit'

  resources :articles do
    member do
      put 'like', to: 'articles#upvote'
      put 'unlike', to: 'articles#downvote'
    end
  end

  resources :videos do
    resources :comments
    member do
      put "like", to: "videos#upvote"
      put "unlike", to: "videos#downvote"
    end
  end

  namespace :blogr do
    resources :posts do
      get :public, :on => :collection
      member do
        patch :publish
        patch :unpublish
      end
    end
    root 'posts#index'
  end

  resources :podcasts do
    member do
      put 'like', to: 'podcasts#upvote'
      put 'unlike', to: 'podcasts#downvote'
    end
  end

  get 'welcome' , to: 'welcomes#index'



  get 'meets/tags/:tag', to: 'meets#category', as: :tags
  get 'videos/tags/:tag', to: 'videos#category', as: :tag




  resources :meets do
    member do
      put "like", to: "meets#upvote"
      put "unlike", to: "meets#downvote"
    end
    collection do
      get 'search'
    end
  end

  resources :events
  get 'welcome/index'

  resources :classrooms

  get '/teachers/new' => 'classrooms#new'

  get 'teachers/show' => 'classrooms#show'


  get '/user/:id' => 'pins#profile'
  get '/teachers/:id' => 'teachers#profile'
  get '/teachers/:id/calendar' => 'teachers#calendar'
  get '/educators' => 'classrooms#all'
  get '/members' => 'pins#all'
  get 'category/:id' => 'pins#category'
  get 'all-categories' => 'pins#all_categories'
  get 'meetup/' => 'meets#welcome'



resources :conversations do
  resources :sends
end

  resources :notifications do
    collection do
      post :mark_as_read
    end
  end



  resources :relationships

  devise_for :users, controllers: {
      sessions: 'users/sessions'
  } do
    resources :users do
      member do
        get :following, :followers
      end
    end
  end

  resources :teachers



  resources :chatrooms do
    resource :chatroom_users
    resources :messages
  end



  get '/explore', to: 'pins#index'





  get '/chatrooms', to: 'chatrooms#index'





end
