Rails.application.routes.draw do
  devise_for :users
  devise_for :admins

  resources :books do
    resources :votes
    resources :comments
  end

  resources :categories
  resources :authors


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
