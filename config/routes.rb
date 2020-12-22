Rails.application.routes.draw do
  devise_for :users
  root to: 'tops#index'
  resources :exercises
  resources :daiets
  resources :savings
  resources :minds
  resources :earlies
end
