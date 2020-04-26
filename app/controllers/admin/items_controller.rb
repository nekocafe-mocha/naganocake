class Admin::ItemsController < Admin::AdminSideController

  def new
    @item = Item.new
    @categories = Category.where(status: '有効')
  end

  def create
    @item = Item.new(item_params)
    if @item.save
    	redirect_to admin_item_path(@item)
    else
      @categories = Category.where(status: '有効')
    	render :new
    end
  end

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    @categories = Category.where(status: '有効')
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
    	redirect_to admin_item_path(params[:id])
    else
      @categories = Category.where(status: '有効')
    	render :edit
    end
  end

  private

  def item_params
  	  	params.require(:item).permit(:name, :caption, :price, :image, :status, :category_id)
  end
end
