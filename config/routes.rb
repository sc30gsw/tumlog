Rails.application.routes.draw do
  get 'earlies/index'
  get 'earlies/new'
  get 'earlies/show'
  devise_for :users
  root to: 'tops#index'
  resources :exercises, only: [:index, :new, :create, :show] 
  resources :daiets, only: [:index, :new, :create, :show]
  resources :learns, only: [:index, :new, :create, :show]
  resources :savings, only: [:index, :new, :create, :show]
  resources :minds, only: [:index, :new, :create, :show]
  resources :earlies, only: [:index, :new, :create, :show]
end
