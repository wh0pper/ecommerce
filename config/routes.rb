Rails.application.routes.draw do
  devise_for :users
  resources :products
  resources :line_items
  root to: "products#index"
  resource :order, only: [:show, :update]
  resource :account, only: [:show]
end
