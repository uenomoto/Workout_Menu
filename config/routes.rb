Rails.application.routes.draw do

  scope module: :public do
    resources :impressions, only: [:new, :index, :show, :create, :edit, :update, :destroy] do
      resources :post_comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
    end
  end

 scope module: :public do
   resources :training_menus, only: [:new, :index, :show, :create, :edit, :update, :destroy]
   get 'training_menus/anywhen/:id', to: 'training_menus#anywhen', as: 'anywhen'
   get 'training_menus/check/:id', to: 'training_menus#check',as: 'check'
   patch 'training_menus/complete/:id', to: 'training_menus#complete',as: 'complete'
  end

  scope module: :public do
    resources :training_names, only:[:new, :create, :index, :show, :edit, :update]
  end

  scope module: :public do
    resources :genres, only: [:index, :create, :edit, :update]
  end

  scope module: :public do
    get 'users/information/:id', to: 'users#show',as: 'user'
    get 'users/information/:id/edit', to: 'users#edit',as: 'users_edit'
    patch 'users/information/:id', to: 'users#update'
    get 'users/information', to: 'users#index',as: 'users'
    get 'users/unsubscribe/:id', to: 'users#unsubscribe',as: 'unsubscribe'
    patch 'users/withdraw/:id', to: 'users#withdraw',as: 'withdraw'
  end

  scope module: :public do
    get root to: 'homes#top'
    get '/about' => 'homes#about',as: 'about'
  end

  namespace :admin do
    resources :post_comments, only: [:index, :show, :destroy]
    get 'post_comments/permember/:id',to: 'post_comments#permember',as: 'permember'
  end
  namespace :admin do
    resources :users, only: [:show]
    patch 'users/withdraw/:id', to: 'users#withdraw'
  end

  namespace :admin do
    get root to: 'homes#top'
  end

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  devise_for :users, skip: [:passwords], controllers: {
    sessions: "public/sessions",
    registrations: "public/registrations"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
