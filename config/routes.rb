Rails.application.routes.draw do
  # get 'user_relationships/new'
  # get 'user_relationships/create'
  # get 'user_relationships/destroy'
  devise_for :users
  root to: 'places#index'
  resources :wishlist_items, only: [ :index, :new, :create ]

  resources :users, except: [ :edit, :update, :destroy ] do
    resources :user_relationships, only: [ :new, :create, :destroy]
  end

  resources :places, only: [ :index, :show ] do
    resources :posts
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
