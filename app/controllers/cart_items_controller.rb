class CartItemsController < CustomerSideController

    def index
    	@cart_items = current_customer.cart_items.order(updated_at: :desc)
        @total_price = @cart_items.sum{ |t| t.item.price * t.quantity }
    end

    def create
        cart_item = current_customer.cart_items.find_or_initialize_by(item_id: cart_item_params[:item_id])
        if cart_item.new_record?
            if cart_item.update(cart_item_params)
    	    	redirect_to cart_items_path
            else
                redirect_back(fallback_location: root_path)
            end
    	else
            new_quantity = cart_item.quantity + cart_item_params[:quantity].to_i
            if cart_item.update(quantity: new_quantity)
                redirect_to cart_items_path
            else
                redirect_back(fallback_location: root_path)
            end
    	end
    end

    def update
        cart_item = current_customer.cart_items.find_or_initialize_by(item_id: cart_item_params[:item_id])
    	cart_item.update(cart_item_params)
    	redirect_to cart_items_path
    end

    def destroy
    	cart_item = CartItem.find(params[:id])
        if cart_item.customer_id != current_customer.id
            redirect_back(fallback_location: root_path)
    	else
            cart_item.destroy
    	    redirect_to cart_items_path
        end
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
