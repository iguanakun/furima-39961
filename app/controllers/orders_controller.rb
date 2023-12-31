class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]
  before_action :move_to_index

  def index
    @order_shipping = OrderShipping.new
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
  end

  def create
    @order_shipping = OrderShipping.new(order_params)
    if @order_shipping.valid?
      pay_item
      @order_shipping.save
      redirect_to root_path
    else
      gon.public_key = ENV['PAYJP_PUBLIC_KEY']
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order_shipping).permit(:postal_code, :prefecture_id, :municipalities,
                                           :house_number, :building_name, :phone_number).merge(item_id: params[:item_id],
                                                                                               user_id: current_user.id, token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_index
    item = Item.find(params[:item_id])
    # 自身が商品を出品している、または売却済みの場合
    if current_user.id == item.user.id || item.order.present?
      redirect_to root_path
    end
  end
end
