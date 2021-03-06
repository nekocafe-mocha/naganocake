class DeliveriesController < CustomerSideController
	def index
        @deliveries = Delivery.where(customer_id: current_customer.id)
		@delivery = Delivery.new
	end

	def create
		@delivery = Delivery.new(delivery_params)
		@delivery.customer_id = current_customer.id
        if @delivery.save
           redirect_to deliveries_path
        else
           @deliveries = Delivery.all
           render :index
        end
	end

	def edit
		@delivery = Delivery.find(params[:id])
		if @delivery.customer_id != current_customer.id
			redirect_back(fallback_location: root_path)
		end
	end

	def update
		@delivery = Delivery.find(params[:id])
		if @delivery.customer_id != current_customer.id
			redirect_back(fallback_location: root_path)
		else
			if @delivery.update(delivery_params)
		   		redirect_to deliveries_path
			else
		   		render :edit
			end
		end
	end

	def destroy
		delivery = Delivery.find(params[:id])
		delivery.destroy
		redirect_to deliveries_path
	end

	private
	def delivery_params
		params.require(:delivery).permit(:postal_code, :address, :name)
    end

end
