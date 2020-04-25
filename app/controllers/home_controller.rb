class HomeController < CustomerSideController
	def top
	  @categories = Category.all
	  @random = Item.order("RANDOM()").limit(4)
    end

    private

    def customer_before_action?
    	false
  	end
end
