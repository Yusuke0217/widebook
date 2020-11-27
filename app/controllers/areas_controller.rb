class AreasController < ApplicationController

  def show
    @area = Area.find_by(id: params[:id])
    @shops = Shop.where(area_id: @area.id)
  end
end
