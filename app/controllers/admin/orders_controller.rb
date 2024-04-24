class Admin::OrdersController < ApplicationController

    
    def index
        @orders = Order.page(params[:page]).per(10)
    end 
    
    def show
        @order = Order.find(params[:id])
        @order_details = @order.order_details
    end 
    
    def update
        @order = Order.find(params[:id])
        @order.update(order_params)
        flash[:notice] = "注文ステータスの変更に成功"
        redirect_to admin_order_path(@order)
        
        if @order.status == "入金確認"
            @order.order_detail.update(making_status: 1)
        end 
    end 
    
    
    
end

    private
        def order_params
      params.require(:order).permit(:postal_code, :address, :name, :payment_method, :total_payment, :shipping_cost, :making_status, :status)
        end 