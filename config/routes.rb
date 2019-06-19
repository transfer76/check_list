Rails.application.routes.draw do
  devise_for :users
  root 'forms#index'
  
  resources :forms
  resources :check_lists
end
