Rails.application.routes.draw do

  devise_for :admins
  devise_for :users

  get 'welcome', to: "welcome#index"
  resources :rooms do
    resources :messages
  end

  resources :private_chats, only: %i[show]

  namespace :manager do
    root 'home#index'
    resources :companies
  end

  namespace :account do
    root 'home#index'
    get 'search', to: 'home#search'
    resources :users, only: %i[edit update show destroy]
    resources :products do
      get 'desactive', on: :member
      get 'active', on: :member
      get 'wish_list', on: :member
    end
  end

  namespace :advertise do
    resources :products  do
      member do
        get :join, to: 'products#join'
        get :leave, to: 'products#leave'
      end
    end
  end

  # get 'rooms/index'
  # resources :users
  # root 'rooms#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
