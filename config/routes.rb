Rails.application.routes.draw do
  resources :checkouts
  devise_for :users
  root 'home#index'

  resources :products

  get "/products/category/:category" => "products#category"
  get "/my-products" => "products#mine"
  get "/:page" => "static#show"
end
