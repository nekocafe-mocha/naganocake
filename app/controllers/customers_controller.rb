class CustomersController < ApplicationController
	def show
	  @customer = current_customer
	end

	def edit
	  customer = Customer.find_by(id: params[:id])
      if customer == current_customer
        @customer = current_customer
      else
      redirect_to customer_path(current_customer) and return
      end
	end

	def update
	end

end
