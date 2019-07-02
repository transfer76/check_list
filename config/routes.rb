Rails.application.routes.draw do
  devise_for :users
  root 'check_lists#index'

  resources :forms do
    resources :form_questions
    member do
      put :publish
    end
  end

  resources :check_lists, except: [:show, :new]
  resources :users
end
