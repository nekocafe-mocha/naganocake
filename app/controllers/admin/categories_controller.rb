class Admin::CategoriesController < ApplicationController

  def index
  	@category = Category.new
  	@categories = Category.where(status: '有効')
  end

  def create
  	@category = Category.new(category_params)
  	if @category.save
  		redirect_to admin_categories_path
  	else
  		@categories = Category.all
  		render :index
  	end
  end

  def edit
  	@category = Category.find(params[:id])
  end

  def update
  	@category = Category.find(params[:id])
  	if @category.update(category_params)
  		redirect_to admin_categories_path
  	else
  		render :edit
  	end
  end

  private
  def category_params
  	params.require(:category).permit(:name, :status)
  end
end
