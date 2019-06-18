Rails.application.routes.draw do
  devise_for :users
  root 'check_lists#index'
  
  resources :check_lists
  resources :users
end
