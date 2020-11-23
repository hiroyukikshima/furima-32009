class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  private
  def item_params
    params.require(:item).permit(:image, :title, :category_id, :status_id, :shipping_charges_id, :shipment_source_id, :days_id, :price).merge(user_id: current_user.id)
  end
end
