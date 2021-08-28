  Rails.application.routes.draw do


  devise_for :users
  root to: "home#index"
  resources :users
  resources :blogs do
    resources :comments, only: :create
  end

end
