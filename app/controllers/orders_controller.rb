class OrdersController < ApplicationController
  def index
    @order_address = OrderAddress.new
    @item = Item.find(params[:item_id])
  end
  def create
     @order_address = OrderAddress.new(order_params)
     @item = Item.find(params[:item_id])
     if @order_address.valid?
       pay_item
      @order_address.save
      redirect_to root_path
     else
      render :index
     end
  end

  private
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
end