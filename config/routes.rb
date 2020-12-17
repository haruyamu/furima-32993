Rails.application.routes.draw do
  devise_for :users
  resources :items
  resources :users

  root to: "items#index"
end
