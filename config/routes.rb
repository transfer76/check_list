Rails.application.routes.draw do
  devise_for :users
  root 'forms#index'

  resources :forms do
    resources :form_questions
  end

  resources :check_lists, except: [:show, :new] do
    member do
      put :publish
    end
  end

  resources :users
end
