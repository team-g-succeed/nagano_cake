class ApplicationController < ActionController::Base

  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admin_orders_path
    when Customer
      customers_my_page_path
    else
      root_path
    end
  end

end
