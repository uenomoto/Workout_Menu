Rails.application.routes.draw do
  namespace :public do
    get 'impressions/new'
    get 'impressions/index'
    get 'impressions/show'
  end
  namespace :public do
    get 'training_menus/new'
    get 'training_menus/index'
    get 'training_menus/show'
    get 'training_menus/edit'
  end
  namespace :public do
    get 'training_names/new'
    get 'training_names/index'
    get 'training_names/show'
    get 'training_names/edit'
  end
  namespace :public do
    get 'genres/index'
    get 'genres/edit'
  end
  namespace :public do
    get 'users/show'
    get 'users/edit'
    get 'users/index'
  end
  namespace :public do
    get 'homes/top'
    get 'homes/about'
  end
  namespace :admin do
    get 'post_comments/index'
    get 'post_comments/show'
  end
  namespace :admin do
    get 'users/show'
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
