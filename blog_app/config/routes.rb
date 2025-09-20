Rails.application.routes.draw do
  devise_for :users
  resources :posts

  # Health check
  get "up" => "rails/health#show", as: :rails_health_check

  # Root path
  root "posts#index"
end
