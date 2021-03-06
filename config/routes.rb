Rails.application.routes.draw do
  devise_for :users, defaults: { format: :json }
  root "welcome#index"
  resources :welcome, only: :index
  resources :users, :only => [:show, :create]
  resources :bookings, only: [:create, :index]
  resources :restaurants, only: [:show, :index]
end
