Rails.application.routes.draw do
  devise_for :users
  root to: 'tops#index'
  resources :exercises, only: [:index, :new, :create] 
  resources :daiets, only: [:index, :new, :create]
  resources :learns, only: [:index, :new, :create]
  resources :savings, only: [:index, :new, :create]
  resources :minds, only: [:index, :new, :create]

end
