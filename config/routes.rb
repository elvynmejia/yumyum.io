Rails.application.routes.draw do
  devise_for :users
  root "welcome#index"
  resources :welcome, only: :index
  resources :users, except: [:new, :edit, :destroy]
end
