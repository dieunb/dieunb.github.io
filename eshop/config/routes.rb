Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'static_pages#index'

  resources :categories, only: %w[index new create show]
  resources :products, only: %w[index new create show]
end
