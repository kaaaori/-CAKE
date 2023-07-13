Rails.application.routes.draw do

  namespace :public do
    get 'cart_items/index'
  end
  
  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  
  
  scope module: :public do
    root to: 'homes#top'
    get '/about' => 'homes#about'
    get '/customers/mypage' => 'customers#show', as: 'mypage'
    get '/customers/information/edit' => 'customers#edit'
    patch '/customers/information' => 'customers#update'
    get '/customers/unsubscribe' => 'customers#unsubscribe'
    patch '/customers/withdrawal' => 'customers#withdrawal'
    delete '/cart_items/destroy_all' => 'cart_items#destroy_all'
    post '/orders/confirm' => 'orders#confirm'
    get '/orders/thanks' => 'orders#thanks'
    
    resources :items, only: [:index, :show]
    resources :orders, only: [:new, :create, :index, :show]
    resources :cart_items, only: [:index, :update, :create, :destroy] do
      member do
        patch 'increase'
        patch 'decrease'
      end
   end
  end
  
  
  
  namespace :admin do
    root to: 'homes#top'
    resources :items, only: [:new, :index, :create, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show]
  end
  
  end
