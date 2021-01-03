class CategoriesController < ApplicationController

  def show
    @category = Category.find_by(id: params[:id])
    @shop_categories = ShopCategory.where(category_id: params[:id]).map { |category|
      category.shop_id
    }
    @shops = Shop.where(id: @shop_categories)

    @categories = Category.where(bussiness_type_id: @category.bussiness_type_id).where.not(id: @category)
  end

  def create
    @category = Category.new(category_params)
    @category.save
  end

  def destroy
  end

  private

    def category_params
      params.require(:category).permit(:name)
    end

end
