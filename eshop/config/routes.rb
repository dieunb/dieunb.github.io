Rails.application.routes.draw do
  root 'static_pages#index'

  get 'sign_up' => 'users#new'
  post 'sign_up' => 'users#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
