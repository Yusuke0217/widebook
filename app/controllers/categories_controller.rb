class CategoriesController < ApplicationController

  before_action :find_category, only: [:show]

  def index
    @categories = Category.all.page(params[:page]).per(21)
  end

  def show
    @shop_categories = ShopCategory.where(category_id: params[:id]).pluck(:shop_id)
    @shops = Shop.where(id: @shop_categories)
    # other_category
    @categories = Category.where(bussiness_type_id: @category.bussiness_type_id).where.not(id: @category)
  end

  private
    def find_category
      @category = Category.find_by(id: params[:id])
    end

end
