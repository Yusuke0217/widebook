class AreasController < ApplicationController

  def index
    @shops = Shop.all
    gon.shops = @shops
  end

  def show
    @area = Area.find_by(id: params[:id])
    @shops = Shop.where(area_id: @area.id)
    @b_types = BussinessType.all
  end

end
