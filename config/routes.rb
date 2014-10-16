Rails.application.routes.draw do
  get 'home/index'

  root to: 'visitors#index'
  devise_for :users
  resources :users
end
