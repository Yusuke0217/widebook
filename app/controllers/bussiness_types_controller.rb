class BussinessTypesController < ApplicationController

  def show
    @b_type = BussinessType.find_by(id: params[:id])
    @categories = Category.where(bussiness_type_id: params[:id])
  end

end
