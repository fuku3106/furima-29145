class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
  end

  def new
  end

  def edit
  end

  def show
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
    params.permit(:image, :name, :description, :price, :category_id, :condition_id, :days_to_ship_id, :delivery_area_id, :shipping_id).merge(user_id: current_user.id)
  end
end
