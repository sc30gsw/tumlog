Rails.application.routes.draw do
  get 'earlies/index'
  get 'earlies/new'
  get 'earlies/show'
  devise_for :users
  root to: 'tops#index'
  resources :exercises, only: [:index, :new, :create, :show, :edit, :update] 
  resources :daiets, only: [:index, :new, :create, :show, :edit, :update]
  resources :learns, only: [:index, :new, :create, :show, :edit, :update]
  resources :savings, only: [:index, :new, :create, :show, :edit, :update]
  resources :minds, only: [:index, :new, :create, :show, :edit, :update]
  resources :earlies, only: [:index, :new, :create, :show, :edit, :update]
end
