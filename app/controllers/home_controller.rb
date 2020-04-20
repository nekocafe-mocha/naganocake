class HomeController < ApplicationController
	def top
	  @categories = Category.all
	  @random = Item.order("RANDOM()").limit(4)
    end
end
