Rails.application.routes.draw do
  devise_for :users
  root 'users#index'
  
  resources :check_lists
  resources :users
end
