Rails.application.routes.draw do
  get    'password_resets/new'
  get    'password_resets/edit'
  root   'static_page#home'
  get    'login',       to: 'sessions#new'
  post   'login',       to: 'sessions#create'
  delete 'login',       to: 'sessions#destroy'
  get    'login/guest', to: 'sessions#guest'
  resources :users do
    member do
      get :favorite
    end
  end
  resources :portfolios
  resources :comments,            only: %i[show create]
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: %i[new create edit update]
  resources :favorites,           only: %i[create destroy]

  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
