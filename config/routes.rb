Rails.application.routes.draw do
  devise_for :admin, skip: [:registrations, :password], controllers:{
    sessions: 'admin/sessions'
  }
  
  
  namespace :admin do
    resources :users, only: [:index, :show, :destroy]
    
    resources :posts, only: [:index, :show, :destroy] do
      resources :post_comments, only: [:destroy]
    end
    
    resources :communities, only: [:new, :index, :show, :create, :edit, :update, :destroy]
  end
  
  scope module: :public do
    devise_for :users
    devise_scope :user do
      post 'users/guest_sign_in', to: 'sessions#guest_sign_in'
    end
    root to: "homes#top"
    
    
    resources :users, only: [:show, :index, :edit, :update, :destroy]
  
    resources :posts, only: [:show, :edit, :create, :update, :destroy] do
      resources :post_comments, only: [:create, :destroy]
    end
    
    resources :communities, only: [:new, :index, :create, :update, :edit, :destroy, :show] do
      resource :community_users, only: [:create, :destroy]
      resource :permits, only: [:create, :destroy]
    end
    
    get "communities/:id/permits" => "communities#permits", as: :permits
    
    resources :community_posts
    
    delete '/' => 'homes#delete_action'
    get '/mypage' => 'users#mypage'
    get '/search', to: 'searchs#search'
  end
  
end