Rails.application.routes.draw do
	root 'home#top'
  	devise_for :customers
  	resources　:customers, only: [:show, :edit, :update]
  	resources　:order_items, only: [:create]
  	resources　:deliveries, [:index, :create, :edit, :update, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
