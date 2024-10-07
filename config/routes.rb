Rails.application.routes.draw do
  devise_for :admin, skip: [:registrations, :password], controllers:{
    sessions: 'admin/sessions'
  }
  
  namespace :admin do
    resources :users, only: [:index, :show, :destroy]
    resources :posts, only: [:show, :destroy]
  end
  
  scope module: :public do
    devise_for :users
    root to: "homes#top"
    
    resources :users, only: [:show, :index, :edit, :update, :destroy]
  
    resources :posts, only: [:show, :edit, :create, :update, :destroy] do
      resources :post_comments, only: [:create, :destroy]
    end
  
    delete '/' => 'homes#delete_action'
    get '/mypage' => 'users#mypage'
    get '/search', to: 'searchs#search'
  end
  
end