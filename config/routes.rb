Rails.application.routes.draw do
  resources :complaints
  resources :complaints
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root to: 'visitors#index'
  devise_for :users
end
