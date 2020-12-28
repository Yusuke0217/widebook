class SearchsController < ApplicationController

  def index
    @shops = Shop.search(params[:search][:name])
    @categories = Category.search(params[:search][:name])
    @bussiness_types = BussinessType.search(params[:search][:id])
    

    if @categories.present?
      @results = Shop.where(id: @categories).page(params[:page]).per(20)
    elsif @shops.present?
      @results = Shop.search(params[:search][:name]).page(params[:page]).per(20)
    elsif @bussiness_types.present?
      @results = Shop.where(id: @bussiness_types).page(params[:page]).per(20)
    else
      # @results = Shop.all
      redirect_to root_url
    end

    @other_categories = Category.where(id: 1).page(params[:page]).per(10)
    
  end

  def show
    @shop = Shop.find_by(id: params[:id])
  end

  private

  def search_params
    params.fetch(:search, {}).permit(:name, :id)
  end

end
