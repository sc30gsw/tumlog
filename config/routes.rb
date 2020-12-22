Rails.application.routes.draw do
  get 'earlies/index'
  get 'earlies/new'
  get 'earlies/show'
  devise_for :users
  root to: 'tops#index'
  resources :exercises
  resources :daiets
  resources :savings
  resources :minds
  resources :earlies
end
