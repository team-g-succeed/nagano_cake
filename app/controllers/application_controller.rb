class ApplicationController < ActionController::Base

  def after_sign_in_path_for(resource)
    case resource
    when Admin
<<<<<<< HEAD
<<<<<<< Updated upstream
      admin_path
=======
      admin_items_path
>>>>>>> Stashed changes
=======
      admin_orders_path
>>>>>>> b317b755058ed9d73ce8951e5c9706f7addb89c3
    when Customer
      root_path
    else
      root_path
    end
  end

end
