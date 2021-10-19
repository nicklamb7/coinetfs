Rails.application.routes.draw do
  resources :articles
  resources :etfs
  resources :assets
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
