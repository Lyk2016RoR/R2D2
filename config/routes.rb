Rails.application.routes.draw do
  devise_for :users
  devise_for :admins

  root "books#index"

  resources :books do
    resources :votes
    resources :comments, only: [:create, :destroy]
  end

  resources :categories, only: [:show, :index]


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
