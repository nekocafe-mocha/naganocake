Rails.application.routes.draw do
  root 'home#top'
  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }
  devise_for :customers, controllers: {
    sessions:      'customers/sessions',
    passwords:     'customers/passwords',
    registrations: 'customers/registrations'
  }
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

end
