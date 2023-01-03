Rails.application.routes.draw do

  devise_for :users, skip: [:passwords], controllers: {
    sessions: "public/sessions",
    registrations: "public/registrations"
  }

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  scope module: :public do
    get "search" => "searches#search"
  end

  scope module: :public do
    get 'tweets/permember/:id',to: 'tweets#permember',as: 'tweet_permember'
    resources :tweets, only: [:new, :index, :show, :create, :edit, :update, :destroy] do
      resources :post_comments, only: [:edit, :update, :create, :destroy]
      resource :favorites, only: [:create, :destroy]
      resource :reports, only: [:create]
    end
  end

 scope module: :public do
   resources :training_menus, only: [:new, :index, :show, :create, :edit, :update, :destroy]
   get 'training_menus/anywhen/:id', to: 'training_menus#anywhen', as: 'anywhen'
   get 'training_menus/check/:id', to: 'training_menus#check',as: 'check'
   patch 'training_menus/complete/:id', to: 'training_menus#complete',as: 'complete'
  end

  scope module: :public do
    resources :training_names, only:[:create, :index, :show, :edit, :update, :destroy]
  end

  scope module: :public do
    resources :genres, only: [:index, :create, :edit, :update, :destroy]
  end

  scope module: :public do
    get 'users/unsubscribe', to: 'users#unsubscribe',as: 'unsubscribe'
    patch 'users/withdraw', to: 'users#withdraw',as: 'withdraw'
    resources :users, only: [:index, :show, :edit, :update,] do
      resource :relationships, only: [:create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
    end
  end

  scope module: :public do
    resources :notifications, only: [:index]
    delete 'notifications/destroy_all', to: 'notifications#destroy_all'
  end


  scope module: :public do
    get root to: 'homes#top'
    get '/main' => 'homes#main',as: 'main'
    get '/guide', to: 'homes#guide'
  end

  namespace :admin do
    resources :tweets, only: [:index, :show, :destroy]
    get 'tweets/permember/:id',to: 'tweets#permember',as: 'permember'
  end
  namespace :admin do
    resources :users, only: [:show]
    patch 'users/withdraw/:id', to: 'users#withdraw'
  end

  namespace :admin do
    get root to: 'homes#top'
  end



  # ゲストログイン
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
    delete 'users/guest_sign_out', to: 'users/sessions#destory'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end