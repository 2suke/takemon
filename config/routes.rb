Rails.application.routes.draw do
  # get    'sessions/new'
  root   'static_page#home'
  get    'login', to: 'sessions#new'
  post   'login', to: 'sessions#create'
  delete 'login', to: 'sessions#destroy'
  resources :users
end
