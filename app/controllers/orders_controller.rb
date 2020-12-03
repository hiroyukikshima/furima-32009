class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :set_item, only: [:index, :create]
  before_action :move_to_index, only: :index

  def index
    return redirect_to root_path if current_user.id == @item.user_id

    @user_purchase_record = UserPurchaseRecord.new
  end

  def new
  end

  def create
    @user_purchase_record = UserPurchaseRecord.new(street_address_params)
    if @user_purchase_record.valid?
      pay_item
      redirect_to item_path(@item)
    else
      render 'orders/index'
    end
  end

  private

  def street_address_params
    params.require(:user_purchase_record).permit(:postal_code, :prefecture, :municipality, :address, :building_name, :phone_number, :purchase_record, :price).merge(item_id: @item.id, user_id: current_user.id, token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: street_address_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_index
    redirect_to root_path if @item_id == @user_id
  end
end
