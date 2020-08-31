Rails.application.routes.draw do
  devise_for :users
  root 'static_pages#index'

  resources :categories, only: %w[index new create show]
  resources :products, only: %w[index new create show]
end
