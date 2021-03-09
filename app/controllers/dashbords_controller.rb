class DashbordsController < ApplicationController

  def show
    @owner = Owner.find_by(id: params[:owner_id])
  end
end
