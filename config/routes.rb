Rails.application.routes.draw do

  resources :tags

  resources :accounts

  resources :groups

  resources :locations

  resources :devices

  resources :tasks

  resources :agenda_items

  resources :participants

  resources :meetings

  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      resources :meetings do
        resources :agenda_items
        resources :tasks
        resources :participants
      end
      resources :registrations, :only => [:index, :create]
      patch 'profile' => 'registrations#update'
    end
  end

  get 'home/index'

  root to: 'visitors#index'
  devise_for :users

  resources :users do
    get 'invite', :on => :member
  end

end
