Rails.application.routes.draw do
  devise_for :users
  root to: 'tops#index'
  resources :exercises do
    resources :exercise_comments, only: :create
    collection do
      get 'search'
    end
  end

  resources :daiets do
    resources :daiet_comments, only: :create
    collection do
      get 'search'
    end
  end

  resources :learns do
    resources :learn_comments, only: :create
    collection do
      get 'search'
    end
  end

  resources :savings do
    resources :saving_comments, only: :create
    collection do
      get  'search'
    end
  end

  resources :minds do
    resources :mind_comments, only: :create
    collection do
      get 'search'
    end
  end

  resources :earlies do
    resources :early_comments, only: :create
    collection do
      get 'search'
    end
  end
  
  resources :users, only: :show
end
