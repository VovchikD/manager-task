Rails.application.routes.draw do
  resources :projects do
    resources :tasks
  end

  root 'tasks#index'

  get "up" => "rails/health#show", as: :rails_health_check
end
