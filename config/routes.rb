Rails.application.routes.draw do
  get    'password_resets/new'
  get    'password_resets/edit'
  root   'static_page#home'
  get    'login', to: 'sessions#new'
  post   'login', to: 'sessions#create'
  delete 'login', to: 'sessions#destroy'
  resources :users
  resources :portfolios
  resources :comments,            only: %i[show create destroy]
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: %i[new create edit update]
end
