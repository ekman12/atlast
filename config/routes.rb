Rails.application.routes.draw do
  get 'wishlist_items/index'
  get 'wishlist_items/new'
  get 'wishlist_items/create'
  # get 'places/index'
  # get 'places/show'
  # get 'posts/index'
  # get 'posts/show'
  # get 'posts/new'
  # get 'posts/create'
  # get 'posts/update'
  # get 'posts/destroy'
  # get 'users/index'
  # get 'users/show'
  # get 'users/new'
  # get 'users/create'
  devise_for :users
  root to: 'places#index'
  resources :users, except: [ :edit, :update, :destroy ]
  resources :places, only: [ :index, :show ] do
    resources :posts
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
