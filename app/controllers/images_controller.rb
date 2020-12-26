class ImagesController < ApplicationController

  def show
    @images = Image.where(shop_id: params[:id])
  end
  
end
