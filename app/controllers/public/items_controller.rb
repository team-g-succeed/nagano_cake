class Public::ItemsController < ApplicationController
  def index
    @items, @sort = get_items(params)
  end

  def show
    @item = Item.find(params[:id])
  end
end
