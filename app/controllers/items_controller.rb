class ItemsController < CustomerSideController
	def index
	  @categories = Category.all
	  if category = Category.find_by(id: params[:category_id])
	    @items = category.items.page(params[:page]).per(8)
	  else
	    @items = Item.all.page(params[:page]).per(8)
	  end
	end

	def show
	  @categories = Category.all
	  @item = Item.find(params[:id])
  	  @cart_item = current_customer.cart_items.new
	end

	private

	def customer_before_action?
    	false
  	end
end