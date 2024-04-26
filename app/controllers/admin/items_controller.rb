class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @items = Item.page(params[:page]).per(10)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
      if @item.save
        flash[:notice] = "商品が#{ @item.id }番目に追加されました。"
        redirect_to admin_items_path
      else
        flash[:alert] = "商品の追加に失敗しました。"
        render :new
      end
  end

  def show
    @item = Item.find(params[:id])
  end


  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to admin_items_path, notice: '商品の更新が正常に行われました。'
    else
      render :edit
    end
  end

  def destroy_multiple
    ActiveRecord::Base.transaction do
      Item.where(id: params[:item_ids]).destroy_all
    end
    respond_to do |format|
      format.html { redirect_to admin_items_url, notice: '選択された商品が削除されました。' }
    end
  rescue ActiveRecord::StatementInvalid => e
    respond_to do |format|
      format.html { redirect_to admin_items_url, alert: '商品の削除中にエラーが発生しました。' }
    end
  end
  
  private

  def item_params
    params.require(:item).permit(:genre_id, :name, :introduction, :price, :is_active, :image)
  end

end
