class Public::OrdersController < ApplicationController
    
    def new
        @order = Order.new
        @order_details = @order.order_details
    end 
        
    def index
        @orders = current_customer.orders
    end 
    
    def show
        @order = Order.find(params[:id])
        @order_details = @order.order_details
    end 
    
   def confirm
     @order = Order.new(order_params)
    if params[:order][:select_address] == "0"
      @order.postal_code = current_end_user.postal_code
      @order.address = current_end_user.address
      @order.name = current_end_user.first_name + current_end_user.last_name
    
    elsif params[:order][:select_address] == "1"
       @address = Address.find(params[:order][:address_id])
       @order.postal_code = @address.postal_code
       @order.address = @address.address
       @order.name = @address.name
   
    elsif params[:order][:select_address] == "2"
      @order.end_user_id = current_end_user.id
   
    end
      @cart_items = current_end_user.cart_items
      @order_new = Order.new
      render :confirm
   end
        
    def create
        @order = current_customer.order.new(order_parms)
        
    end
    
    def thanks; end 
        
    private
    
    
    
    def order_params
      params.require(:order).permit(:postal_code, :address, :name, :payment_method, :total_payment, :shipping_cost)
    end 
end
