class BussinessTypesController < ApplicationController

  def show
    @b_type = BussinessType.find_by(id: params[:id])
    @categories = Category.where(bussiness_type_id: params[:id])
    
    @some_shops = BussinessType.eager_load(categories: :shop_categories).where(id: params[:id]).pluck(:shop_id).shuffle
    @ex_shops = Shop.where(id: @some_shops)
  end

end
