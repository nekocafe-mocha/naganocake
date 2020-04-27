class OrdersController < CustomerSideController

	def index
		@orders = Order.where(customer_id: current_customer.id)
	end

	def show
		@order = Order.find(params[:id])
		@order_items = @order.order_items
	end

	def new
		@order = Order.new
		@customer = current_customer
		@deliveries = current_customer.deliveries
	end

	def confirm
		select_type = order_params[:select_type]
		@cart_items = current_customer.cart_items
		@total_price = @cart_items.sum{ |t| t.item.price * t.quantity }
		case select_type
		when 'my_delivery'
			@order = current_customer.orders.new(
				name: current_customer.full_name,
			    postal_code: current_customer.postal_code,
			    address: current_customer.address,
			    phone: current_customer.phone,
			    total_price: @total_price,
			    pay_select: order_params[:pay_select].to_i
			)
		when 'registred_delivery'
			delivery = current_customer.deliveries.find_by(
				id: order_params[:delivery_id]
			)

			@order = current_customer.orders.new(
				name: delivery.name,
			    postal_code: delivery.postal_code,
			    address: delivery.address,
		    	phone: current_customer.phone,
			    total_price: @total_price,
			    pay_select: order_params[:pay_select].to_i
			)
		when 'new_delivery'
			@delivery = current_customer.deliveries.new(
				name: order_params[:name],
				address: order_params[:address],
				postal_code: order_params[:postal_code],
			)

			@order = current_customer.orders.new(
				name: @delivery.name,
				postal_code: @delivery.postal_code,
			    address: @delivery.address,
		    	phone: current_customer.phone,
			    total_price: @total_price,
			    pay_select: order_params[:pay_select].to_i
			)
			@delivery.save
		end
	end

	def thanks
		@order = current_customer.orders.new(order_params)
		ActiveRecord::Base.transaction do
	    	if @order.save!
	    		cart_items = current_customer.cart_items
	    		cart_items.each do |c_i|
		    		order_item = @order.order_items.new(
		    			item_id: c_i.item_id,
		    			price: c_i.item.price,
		    			quantity: c_i.quantity,
		    		)
		    		order_item.save
		    	end
		    	cart_items.destroy_all
	    	else
	    		redirect_back(fallback_location: root_path)
	    	end
	    end
	end

	private
	def order_params
		params.require(:order).permit(
			:pay_select,
			:select_type,
			:delivery_id,
			:postal_code,
			:name,
			:address,
			:total_price,
			:phone
		)
    end
end
