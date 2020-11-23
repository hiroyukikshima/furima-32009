class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new

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
    params.require(:item).permit(:explanation ,:image, :title, :category_id, :status_id, :shipping_charge_id, :shipment_source_id, :days_id, :price).merge(user_id: current_user.id)
  end
end
