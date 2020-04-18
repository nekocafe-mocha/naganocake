class ApplicationController < ActionController::Base

def after_sign_in_path_for(resource)
  case resource
   when Customer
     root_path
   when Admin
     admin_home_top_path
  end
end



end
