class Public::HomesController < ApplicationController
<<<<<<< Updated upstream
  def top
    #@items = Item.page(params[:page]).per(4).order(created_at: :desc)
  end
  def about
=======
 def top
    @items = Item.order(created_at: :desc).page(params[:page]).limit(4)
    @genres = Genre.all
 end

 def about
 end
>>>>>>> Stashed changes

  end
end
