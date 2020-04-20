class CartItemsController < ApplicationController

    def index
    	@cart_items = current_customer.cart_items
    end

    def create
    	cart_item = current_customer.cart_items.new(cart_item_params)
    	if cart_item.save
	    	redirect_to cart_items_path
    	else
	    	redirect_back(fallback_location: root_path)
    	end
    end

    def update
    	cart_item = CartItem.find(params[:id])
    	cart_item.update(cart_item_params)
    	redirect_to cart_items_path
    end

    def destroy
    	cart_item = CartItem.find(params[:id])
    	cart_item.destroy
    	redirect_to cart_items_path
    end

    def cart_destroy
    	cart_items = current_customer.cart_items
    	cart_items.destroy_all
    	redirect_to cart_items_path
    end

    private

    def cart_item_params
    	params.require(:cart_item).permit(:quantity, :item_id)
    end


end
