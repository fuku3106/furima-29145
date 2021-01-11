class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :item_find, only: [:index, :create]
  before_action :sold_out_item, only: [:index]

  def index
    @user_order = UserOrder.new
    redirect_to root_path if user_signed_in? && current_user.id == @item.user_id
  end

  def create
    @user_order = UserOrder.new(order_params)
     if @user_order.valid?
       pay_item
       @user_order.save
       redirect_to root_path
     else
       render action: :index
     end
  end

  private

 def order_params
  params.require(:user_order).permit(:postal_code, :delivery_area_id, :municipality, :block_number, 
    :building_name, :tel).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
 end

 def item_find
  @item = Item.find(params[:item_id])
 end

 def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: order_params[:token],
        currency: 'jpy'
      )
 end

 def sold_out_item
  redirect_to root_path if @item.order.present?
 end

end