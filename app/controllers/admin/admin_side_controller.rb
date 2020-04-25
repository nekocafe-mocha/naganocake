class Admin::AdminSideController < ApplicationController

	before_action :authenticate_admin!

end
