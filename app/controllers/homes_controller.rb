class HomesController < ApplicationController

  def index
    @areas = Area.all
    @categories = Category.all.page(params[:page]).per(15)
    @b_types = BussinessType.all
  end
end
