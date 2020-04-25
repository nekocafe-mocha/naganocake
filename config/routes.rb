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


  resources :customers, only: [:show, :edit, :update] do
    member do
      get 'confirm'
    end
  end
  resources :order_items, only: [:create]
  resources :deliveries, only: [:index, :create, :edit, :update, :destroy]
  resources :cart_items, only: [:create, :destroy, :update, :index]
  delete 'cart_items' => 'cart_items#cart_destroy', as: 'cart_items_destroy'
  resources :items, only: [:index, :show]
  resources :orders, only: [:show, :index, :create, :new] do
    collection do
      get 'confirm'
      post 'thanks'
      get 'thanks', to: 'items#index'
    end
  end

  namespace :admin do
    get 'home/top'
    resources :customers, only: [:index, :show, :edit, :update]
    resources :categories, only: [:index, :create, :edit, :update]
    resources :items, except: [:destory]
    resources :orders, only: [:index, :show, :update] do
       resources :order_items, only: [:update]
    end
  end

end
