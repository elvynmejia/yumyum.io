Rails.application.routes.draw do
  root "welcome#index"
  resources :welcome, only: :index
  resources :users, except: [:new, :edit, :destroy]
end
