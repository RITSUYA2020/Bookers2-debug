Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show, :index, :edit, :update] do
  	resource :relationships, only: [:create, :destroy]
  	get :follows
  	get :followers
  end
  resources :books
  root 'home#top'
  get 'home/about' => 'home#about'
end