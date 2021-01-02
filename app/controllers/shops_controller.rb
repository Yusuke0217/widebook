class ShopsController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :show, :update, :destroy]
  before_action :admin_user, except: [:show, :index]
  before_action :find_shop, only: [:edit, :update, :show, :destroy]

  def index
    @b_shops = Category.joins(shop_categories: :shop).select('shops.*', 'shop_categories.shop_id', 'categories.bussiness_type_id').where(bussiness_type_id: params[:id]).map { |result| result.shop_id }.uniq

    @c_shops = ShopCategory.joins(:shop).select('shop_categories.*', 'shops.*').where(category_id: params[:id]).map { |result| result.shop_id }

    if params[:detail] == 'category'
      @shops = Shop.where(id: @c_shops).page(params[:page]).per(20)
    elsif params[:detail] == 'b_type'
      @shops = Shop.where(id: @b_shops).page(params[:page]).per(20)
    end
  end

  def new
    @shop = Shop.new
    10.times{@shop.images.build}
    @shop.mediums.build
  end
  
  def show
    @reviews = Review.where(shop_id: @shop.id).order(created_at: :desc).page(params[:page]).per(3)
    @scores = Review.shop_reviews(@shop.id)
    @avg = Review.avg_score(@scores).round(1)
    @categories = ShopCategory.where(shop_id: @shop.id)
  end
  
  def create
    @user = User.find(current_user.id)
    @shop = @user.shops.build(shop_params)
    if @shop.save
      flash[:success] = "お店を登録しました。"
      redirect_to shop_url(@shop)
    else
      render "new"
    end
  end

  def edit
    10.times{@shop.images.build}
  end

  def update
    if @shop.update_attributes(shop_params)
      flash[:success] = "お店の情報を更新しました。"
      redirect_to shop_path(@shop)
    else
      render "edit"
    end
  end

  def destroy
    if @shop.destroy
      flash[:success] = "お店を削除しました。"
      redirect_to shop_views_path || root_url
    else
      flash[:danger] = "削除に失敗しました。"
      render "shops#index"
    end
  end


  private

    def shop_params
      params.require(:shop).permit(:name, :address, :address_building, :phone_number, :content, :booking, :area_id, :budget, :holidays, :b_hours_first, :b_hours_last, { category_ids: [] }, images_attributes: [:image, :id], mediums_attributes: [:home_page, :facebook, :instagram, :twitter] )
    end

    def find_shop
      @shop = Shop.find_by(id: params[:id])
    end


end
