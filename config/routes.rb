Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root to: 'static_pages#index'

  devise_for :users

  resources :links do
    member do
      patch :share
      patch :hide
    end
  end

  resources :tags, only: %i[index show]
end
