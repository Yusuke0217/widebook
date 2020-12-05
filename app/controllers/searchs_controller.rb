class SearchsController < ApplicationController

  def index
    @shops = Shop.search(params[:search][:name])
    @categories = Category.search(params[:search][:name])
    @bussiness_types = BussinessType.search(params[:search][:id])
    

    if @categories.present?
      @results = Shop.where(id: @categories)
    elsif @shops.present?
      @results = Shop.search(params[:search][:name])
    elsif @bussiness_types.present?
      @results = Shop.where(id: @bussiness_types)
    else
      # @results = Shop.all
      redirect_to root_url
    end

    @other_categories = Category.where(id: 3)
    
  end

  private

  def search_params
    params.fetch(:search, {}).permit(:name, :id)
  end

end
