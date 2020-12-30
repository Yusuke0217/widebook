class BussinessTypesController < ApplicationController

  def show
    @b_type = BussinessType.find_by(id: params[:id])
    @categories = Category.where(bussiness_type_id: params[:id])
    # @some_shops = BussinessType.rand_shops(id: params[:id]).shuffle.uniq

    @some_shops = BussinessType.joins(categories: :shop_categories).select("bussiness_types.id", "categories.bussiness_type_id", "shop_categories.shop_id", "shop_categories.category_id").where(id: params[:id]).map { |result| result.shop_id }.shuffle.uniq
    
    @ex_shops = Shop.where(id: @some_shops)
  end

end
