Rails.application.routes.draw do
  devise_for :users
  resources :posts

  # Health check
  get "up" => "rails/health#show", as: :rails_health_check

  # Root path
  root "posts#index"

  if Rails.env.development?
    require "letter_opener_web"  # <--- garante que a constante exista
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
