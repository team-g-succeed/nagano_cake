class ApplicationController < ActionController::Base

  def after_sign_in_path_for(resource)
    case resource
    when Admin
<<<<<<< Updated upstream
      admin_path
=======
      admin_items_path
>>>>>>> Stashed changes
    when Customer
      root_path
    else
      root_path
    end
  end

end
