  Rails.application.routes.draw do


  devise_for :users
  root to: "home#index"
  resources :users
  resources :blogs do
    resources :comments, only: :create
    collection do
      get 'search'
    end
  end

end
