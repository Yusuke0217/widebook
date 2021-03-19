class HomesController < ApplicationController

  def index
    @areas = Area.all
    @categories = Category.all.page(params[:page]).per(15)
    @purposes = Purpose.all
    @shops = Shop.all
    @user = User.find_by(id: current_user.id)
  end
end
