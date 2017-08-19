Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users
  resources :users

  mount SimpleDiscussion::Engine => "/community"

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
end
