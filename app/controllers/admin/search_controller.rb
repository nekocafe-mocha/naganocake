class Admin::SearchController < Admin::AdminSideController
  def search
  	@customers = Customer.where(['family_name LIKE ? OR first_name LIKE ?', "%#{params[:keyword]}%", "%#{params[:keyword]}%"])
  	@items = Item.where(['name LIKE ?', "%#{params[:keyword]}%"])
  end
end
