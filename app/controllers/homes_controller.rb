class HomesController < ApplicationController

  def index
    @areas = Area.all
    @categories = Category.all.page(params[:page]).per(10)
    @b_types = BussinessType.all
  end
end
