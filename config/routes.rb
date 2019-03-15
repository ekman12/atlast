Rails.application.routes.draw do
  # get 'user_relationships/new'
  # get 'user_relationships/create'
  # get 'user_relationships/destroy'
  # root to: 'places#index'
  root to: 'pages#home'
  devise_for :users, :controllers => { :omniauth_callbacks => 'users/omniauth_callbacks' }

  resources :users, except: [ :edit, :update, :destroy ] do
    member do
      get :following, :followers
    end
    resources :user_relationships, only: [ :new, :create, :destroy]
    resources :wishlist_items, only: [:index]
  end

  resources :places, only: [ :index, :show ] do
    resources :wishlist_items, only: [ :create ]
  end

  resources :wishlist_items, only: [ :index ]
  resources :posts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
