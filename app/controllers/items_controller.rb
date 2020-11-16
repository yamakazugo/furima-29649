class ItemsController < ApplicationController
  before_action :authenticate_user!, only:[:new, :create]
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end

  end

  private

  def item_params
    params.require(:item).permit(:item_name, :explain, :category_id, :item_condition_id, :delivery_feed_id, :shipping_origin_id, :day_until_shipping_id, :price, :image).merge(user_id: current_user.id)
  end


end
