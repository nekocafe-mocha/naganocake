class ItemsController < ApplicationController
	def index
	  @categories = Category.all
	  if category = Category.find_by(id: params[:category_id])
	    @items = category.items
	  else
	    @items = Item.all
	  end
	end

	def show
	  @categories = Category.all
	  @item = Item.find(params[:id])
	end
end