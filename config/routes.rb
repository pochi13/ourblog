  Rails.application.routes.draw do
    mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  resources :contacts


  resources :contacts
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
