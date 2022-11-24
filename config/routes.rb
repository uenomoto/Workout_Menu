Rails.application.routes.draw do
  
  scope module: :public do
    resources :impressions, only: [:new, :index, :show, :create] do
      resources :post_comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
    end
  end
  
 scope module: :public do
   resources :training_menus
   get 'training_menus/check/:id', to: 'training_menus#check',as: 'check'
   post 'training_menus/complete', to: 'training_menus#complete',as: 'complete'
  end
  
  scope module: :public do
    resources :training_names, only:[:new, :create, :index, :show, :edit, :update]
  end
  
  scope module: :public do
    resources :genres, only: [:index, :create, :edit, :update]
  end
  
  scope module: :public do
    resources :users, only: [:show, :edit, :update, :index]
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
