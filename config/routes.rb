Rails.application.routes.draw do
  root 'static_page#home'
  # get  '/users', to: 'static_page#users'
  # get  '/users/new', to: 'users/new'
  resources :users
end
