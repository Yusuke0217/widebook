class HomesController < ApplicationController

  def index
    @areas = Area.all
    @b_types = BussinessType.all
  end
end
