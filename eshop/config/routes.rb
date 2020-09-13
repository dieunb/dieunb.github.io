Rails.application.routes.draw do
  devise_for :users
  root 'static_pages#index'

  resources :categories, only: %w[index new create show]
  resources :products, only: %w[index new create show] do
    resources :reviews, only: %w[create]
  end

  resources :reviews, only: %w[] do
    resources :comments, only: %w[create]
  end

  namespace :admin do
    root 'static_pages#index'
  end
end
