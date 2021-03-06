class OrdersController < ApplicationController
   before_action :authenticate_user!
   before_action :move_to_index
   before_action :set_params

  def index
    @order_address = OrderAddress.new
  end
  def create
     @order_address = OrderAddress.new(order_params)
     if @order_address.valid?
       pay_item
      @order_address.save
      redirect_to root_path
     else
      render :index
     end
  end

  private
  def set_params
    @item = Item.find(params[:item_id])
  end
  def order_params
    params.require(:order_address).permit(:postal_code,:prefecture_id,:address,:city,:phone,:bill).merge(user_id: current_user.id,item_id: params[:item_id],token: params[:token])
  end
  def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        card: order_params[:token],
        amount: @item.price,
        currency: 'jpy'
      )
  end
  def move_to_index
     @item = Item.find(params[:item_id])
    if current_user.id == @item.user.id || @item.order.present?
      redirect_to root_path
    end
  end
 
end