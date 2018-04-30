Rails.application.routes.draw do
  devise_for :users
  resources :products
  resources :order_items
  root to: "products#index"

end
