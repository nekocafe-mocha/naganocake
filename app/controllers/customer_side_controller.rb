class CustomerSideController < ApplicationController

	before_action :authenticate_customer!, if: :customer_before_action?

	def customer_before_action?
    	true
  	end
end
