Rails.application.routes.draw do
  devise_for :customers

  resources :cart_items, only: [:create, :destory, :update, :index]
  resources :items, only: [:index, :show]
  resources :orders, only: [:show, :index, :create]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
