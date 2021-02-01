Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end

  resources :users, only: :show do
    resources :reviews, only: [:index, :new, :create]
    member do
      get :followings, to: 'relationships#followings'
      get :followers, to: 'relationships#followers'
    end
  end

  resources :relationships, only: [:create, :destroy]

  root "homes#index"
  resources :posts, except: :index do
    resources :favorites, only: [:create, :destroy]
    collection do
      get 'search'
    end
  end

  resources :rooms, only: [:create, :index] do
    resources :messages, only: [:index, :create]
  end

  resources :notifications, only: :index
end
