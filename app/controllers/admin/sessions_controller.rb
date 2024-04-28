# frozen_string_literal: true

class Admin::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end
  def after_sign_out_path_for(resource)
    new_admin_session_path
  end 
  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  
  private
  
  def customer_state
    customer = Customer.find_by(email: params[:customer][:email])
    if customer.nil?
      redirect_to new_customer_registration_path
    end
    if customer.valid_password?(params[:customer][:password]) && (customer.is_active == false)
      redirect_to new_customer_registration_path
    end
  end
  
end
