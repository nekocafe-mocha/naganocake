class Admin::HomeController < Admin::AdminSideController
  def top
  	@range = Date.today.beginning_of_day..Date.today.end_of_day
  	@count = Order.where(created_at: @range).count
  end
end
