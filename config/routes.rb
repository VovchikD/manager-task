# frozen_string_literal: true

Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  devise_for :users

  resources :projects do
    member do
      post 'add_teammate'
      delete 'remove_teammate'
    end
    resources :tasks
  end

  root 'projects#index'

  get 'up' => 'rails/health#show', as: :rails_health_check
end
