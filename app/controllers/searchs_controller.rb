class SearchsController < ApplicationController

  def index
    @shops = Shop.search(params[:search][:name])
    @categories = Category.search(params[:search][:name])
    @bussiness_types = BussinessType.search(params[:search][:id]).uniq
    @b_types = BussinessType.k_word(params[:search][:name])

    if @bussiness_types.present?
      @results = Shop.where(id: @bussiness_types).page(params[:page]).per(20)
    elsif @b_types.present?
      @results = Shop.where(id: @b_types).page(params[:page]).per(20)
    elsif @categories.present?
      @results = Shop.where(id: @categories).page(params[:page]).per(20)
    elsif @shops.present?
      @results = Shop.search(params[:search][:name]).page(params[:page]).per(20)
    else
      @results = Shop.all.page(params[:page]).per(20)
    end
    
  end

  def show
    @shop = Shop.find_by(id: params[:id])
  end

  private

  def search_params
    params.fetch(:search, {}).permit(:name, :id)
  end

end
