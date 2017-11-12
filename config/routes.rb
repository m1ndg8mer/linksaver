Rails.application.routes.draw do
  root to: 'static_pages#index'

  devise_for :users

  resources :links do
    member do
      patch :share
      patch :hide
    end
  end
end
