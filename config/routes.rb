Rails.application.routes.draw do
  devise_for :admins
  root 'home#top'

  devise_for :customers
  resources :customers, only: [:show, :edit, :update]
  resources :order_items, only: [:create]
  resources :deliveries, only: [:index, :create, :edit, :update, :destroy]
  resources :cart_items, only: [:create, :destory, :update, :index]
  resources :items, only: [:index, :show]
  resources :orders, only: [:show, :index, :create]

  namespace :admin do
    resources :customers, only: [:index, :show, :edit, :update]
    resources :categories, only: [:index, :create, :edit, :update]
    resources :items, except: [:destory]
    resources :orders, only: [:index, :show, :update] do
      resources :order_items, only: [:update]
    end
 	end



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end