class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!
  def top
  　@items = Item.order(created_at: :desc).page(params[:page]).limit(4)
    @genres = Genre.all
  end
end
