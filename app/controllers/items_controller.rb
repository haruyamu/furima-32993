class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show]
  before_action :set_params, only: [:show,:edit,:update]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render :new
    end
  end
  def show
  end
  def edit
   if current_user.id != @item.user_id 
     redirect_to root_path
   end
  end
  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end
    def destroy
      item = Item.find(params[:id])
       if user_signed_in? && current_user.id == item.user_id 
        item.destroy
        redirect_to root_path
       end
    end
  private
  def item_params
    params.require(:item).permit(:name, :explain, :category_id, :state_id, :shipping_fee_id, :prefecture_id, :schedule_delivery_id, :price,:image).merge(user_id: current_user.id)
  end
  def set_params
     @item = Item.find(params[:id])
  end
end
