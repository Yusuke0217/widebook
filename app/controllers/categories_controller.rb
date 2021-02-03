class CategoriesController < ApplicationController

  before_action :find_category, only: [:show]
  before_action :ua, only: [:index]

  def index
    if(ua.include?('Mobile') || ua.include?('Android'))
      per = 10
      @categories = Category.all.page(params[:page]).per(per)
    else
      per = 21
      @categories = Category.all.page(params[:page]).per(per)
    end
  end

  def show
    @shop_categories = ShopCategory.where(category_id: params[:id]).pluck(:shop_id)
    @shops = Shop.where(id: @shop_categories)
    
    # other_category
    @categories = Category.where.not(id: @category)
  end

  private
    def find_category
      @category = Category.find_by(id: params[:id])
    end

end
