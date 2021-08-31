  Rails.application.routes.draw do


  devise_for :users
  root to: "home#index"
  resources :users
  resources :blogs do
    resource :favarites, only: [:create,:destroy]
    resources :comments, only: [:create,:destroy]
    collection do
      get 'search'
      end
    end

end
