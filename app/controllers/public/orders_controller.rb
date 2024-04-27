class Public::OrdersController < ApplicationController
    before_action :authenticate_customer!
    include ApplicationHelper
    
    def index
        @orders = current_customer.orders
    end 
    
      
    def show
        @order = Order.find(params[:id])
        @order_details = @order.order_details
    end 
    
    def new
        @order = Order.new
        @address = current_customer.address
    end 
    
   def confirm
    @cart_items = current_customer.cart_items
    
    @order = Order.new(order_params)
        
        @order.total_payment = billing(@order)
    
     if params[:order][:my_address] == "1"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = full_name(current_customer)

     elsif params[:order][:my_address] == "2"
      ship = Address.find(params[:order][:address_id])
      @order.postal_code = ship.postal_code
      @order.address = ship.address
      @order.name = ship.name

     elsif params[:order][:my_address] == "3"
      @order.postal_code = params[:order][:postal_code]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
      @ship = "1"

      unless @order.valid? == true
        @addresses = Address.where(customer: current_customer)
        render :new
      end
     end
   end
        
    def create
        @order = current_customer.orders.new(order_params)
        @order.save!
        
        
        if params[:order][:ship] =="1"
            current_customer.address.create(address_params)
        end 
        
        @cart_items = current_customer.cart_items
        @cart_items.each do |cart_item|
            @order_detail = OrderDetail.new
            @order_detail.item_id = cart_item.item_id
            @order_detail.order_id = @order.id
            @order_detail.amount = cart_item.amount
            @order_detail.price = cart_item.item.price * cart_item.amount
            @order_detail.save
        end 
        
        @cart_items.destroy_all
        
        redirect_to thanks_orders_path
    end
    
    def thanks
    end 
        
    private
    def address_params
        params.require(:order).permit(:postal_code, :address, :name, :payment_method, :total_payment)
    end 
    
    
    def order_params
      params.require(:order).permit(:postal_code, :address, :name, :payment_method, :total_payment, :shipping_cost)
    end 
end
