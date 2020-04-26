class Admin::OrdersController < Admin::AdminSideController

  def index
  	if customer = Customer.find_by(id: params[:customer_id])
  		@orders = customer.orders.page(params[:page]).per(10)
  	elsif params[:created_at]
  		@orders = Order.where(created_at: Date.today.beginning_of_day..Date.today.end_of_day).page(params[:page]).per(10)
  	else
  		@orders = Order.all.page(params[:page]).per(10)
  	end
  end

  def show
  	@order = Order.find(params[:id])
  	@order_items = @order.order_items
  end

  def update
  	order = Order.find(params[:id])
  	order.update(order_params)
  	redirect_to admin_order_path(order)
  end

  private

  def order_params
  	params.require(:order).permit(:status)
  end
end
