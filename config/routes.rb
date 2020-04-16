Rails.application.routes.draw do
  devise_for :customers

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
