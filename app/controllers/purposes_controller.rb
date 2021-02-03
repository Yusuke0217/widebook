class PurposesController < ApplicationController

  def show
    @purpose = Purpose.find_by(id: params[:id])
    @categories = Category.all
    
    @some_shops = Purpose.eager_load(shop_purposes: :shop).where(id: params[:id]).pluck(:shop_id).shuffle
    @ex_shops = Shop.where(id: @some_shops)
  end

end
