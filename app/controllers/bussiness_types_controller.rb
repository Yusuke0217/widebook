class BussinessTypesController < ApplicationController

  def show
    @b_type = BussinessType.find_by(id: params[:id])
    @categories = Category.where(bussiness_type_id: params[:id])
    @some_shops = BussinessType.rand_shop(id: params[:id]).shuffle.uniq
    @ex_shops = Shop.where(id: @some_shops)
  end

end
