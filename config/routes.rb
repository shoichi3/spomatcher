Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end

  resources :users, only: :show

  root "homes#index"
  resources :posts do
    resources :favorites, only: [:create, :destroy]
  end
  resources :rooms, only: [:create, :index] do
    resources :messages, only: [:index, :create]
  end
end
