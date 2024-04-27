class Public::HomesController < ApplicationController
 def top
    @items = Item.order(created_at: :desc).page(params[:page]).limit(4)
    @genres = Genre.all
 end

 def about
 end


end
