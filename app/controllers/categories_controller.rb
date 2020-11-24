class CategoriesController < ApplicationController

  def index
    @categories = Category.include(:shop).all
    # @cateory = Category.find(params[:category_id])
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
