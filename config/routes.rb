Rails.application.routes.draw do
  resources :relationships, only: [:create, :destroy]
  devise_for :users
  resources :drivets do
    resource :like, only: [:create, :destroy]
  end

  get 'profiles' => 'profiles#index'

  get 'profiles/:id' => 'profiles#show', as: :profile

  # post 'drivets' => 'drivets#create'
  # get 'drivets/new' => 'drivets#new', as: 'new/drivet'
  # get 'drivets' => 'drivets#index'
  # get 'drivets/:id' => 'drivets#show', as: :drivet
  # get 'drivets/:id/edit' => 'drivets#edit', as: 'edit/drivet'
  # put 'drivets/:id' => 'drivets#update'
  # patch 'drivets/:id' => 'drivets#update'
  # delete 'drivets/:id' => 'drivets#destroy'
  root 'profiles#index'




end
