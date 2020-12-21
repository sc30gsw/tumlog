Rails.application.routes.draw do
  devise_for :users
  root to: 'tops#index'
  resources :exercises, only: [:index, :new, :create] 
  resources :daiets, only: :index
  resources :learns, only: :index
  resources :savings, only: :index
  resources :minds, only: :index

end
