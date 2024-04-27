class Public::ItemsController < ApplicationController
<<<<<<< Updated upstream
  def index
    @items, @sort = get_items(params)
    @items = @items.page(params[:page]).per(8)
  end
=======
 

>>>>>>> Stashed changes
  
  def show
    @item = Item.find(params[:id])
  end

  private

  def get_items(params)
    # デフォルトのソートパラメータを安全な値に設定
    sort = params[:sort] || 'created_at DESC'  # 例として created_at を使用
    # params[:sort] の値をチェックして、許可された値のみを使用
    allowed_sorts = ['created_at DESC', 'price ASC', 'name ASC']
    sort = allowed_sorts.include?(params[:sort]) ? params[:sort] : 'created_at DESC'
    items = Item.order(sort)
    return items, sort
  end
end
