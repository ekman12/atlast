Rails.application.routes.draw do
  devise_for :users
  root to: 'places#index'
  resources :wishlist_items, only: [ :index, :new, :create ]
  resources :users, except: [ :edit, :update, :destroy ]
  resources :places, only: [ :index, :show ] do
    resources :posts
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
