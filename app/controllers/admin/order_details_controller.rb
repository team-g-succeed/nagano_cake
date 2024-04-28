class Admin::OrderDetailsController < ApplicationController
    before_action :authenticate_admin!
    
    def update
        @order_detail = OrderDetail.find(params[:id])
        
        if @order_detail.update(order_detail_params)
           @order = @order_detail.order
           
        if OrderDetail.find_by(making_status: "製作中").present?
            @order.update(status: "製作中")
        else
            @order.update(status: "入金確認")
        end 
        
        @order_details = @order.order_details
        if @order_details.all? { |order_detail| order_detail.making_status == "製作完了"}
            @order.update(status: "発送準備中")
        end 
        
        redirect_to admin_order_path(@order_detail.order)
        else
            render 'admin/orders/show'
        end 
    end 
            
        
        
        
        
        # たいちゃんの記述
        # if @order_detail.making_status == "製作中"
        #     @order.update(status: 2)
        #     flash[:notice] = "製作ステータスの変更をしました。"
        # end 
        
        # if @order.order_details == @order.order_details.where(making_status: 3)
        #     @order.update(status: 3)
        #     flash[:notice] = "製作ステータスの更新をしました。"
        #     @order.save
        # end
        
        # redirect_to request.referer
    #end 
    
    private
    
    def order_detail_params
        params.require(:order_detail).permit(:making_status)
    end 
end
