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

	private
  	def customer_params
  		params.require(:customer).permit(:family_name, :first_name, :family_name_kana, :first_name_kana, :postal_code, :address, :phone, :email)
  	end
end
