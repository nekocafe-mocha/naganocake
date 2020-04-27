class ApplicationController < ActionController::Base

	def after_sign_in_path_for(resource)
	  	case resource
	   		when Customer
	     		root_path
	   		when Admin
	     		admin_home_top_path
	  	end
	end

	def after_sign_out_path_for(resource)
		case resource
		   	when :customer
		     	root_path
		   	when :admin
		     	new_admin_session_path
		end
	end
end
