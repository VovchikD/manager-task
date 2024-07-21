# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  resources :projects do
    resources :tasks
  end

  root 'projects#index'

  get 'up' => 'rails/health#show', as: :rails_health_check
end
