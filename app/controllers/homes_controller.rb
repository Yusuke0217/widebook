class HomesController < ApplicationController

  def index
    @areas = Area.all
  end
end
