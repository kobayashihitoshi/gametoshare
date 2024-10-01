Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  resources :posts, only: [:show, :edit, :create, :update, :destroy]
  resources :users, only: [:show, :index, :edit, :update, :destroy]
  
  delete '/' => 'homes#delete_action'
  get '/mypage' => 'users#mypage'
end