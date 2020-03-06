Rails.application.routes.draw do
  root 'static_page#home'
  get  '/users', to: 'users#users'
  resources :users
end
