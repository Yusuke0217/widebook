class ShopsController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :destroy]
  before_action :admin_user, except: [:index, :show]
  before_action :find_shop, only: [:edit, :update, :show, :destroy]

  def index
    @c_shops = Shop.c_shops(params[:id])
    @b_shops = Shop.b_shops(params[:id])
    
    if params[:detail] == 'category'
      @shops = Shop.where(id: @c_shops).page(params[:page]).per(20)
      @index_type = Category.find_by(id: params[:id])
    elsif params[:detail] == 'b_type'
      @shops = Shop.where(id: @b_shops).page(params[:page]).per(20)
      @index_type = BussinessType.find_by(id: params[:id])
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
      params.require(:shop).permit(:name, :address, :address_building, :phone_number, :content, :booking, :area_id, :budget, :holidays, :b_hours_first, :b_hours_last, { category_ids: [] }, { pay_card_ids: [] }, images_attributes: [:image, :id], mediums_attributes: [:home_page, :facebook, :instagram, :twitter] )
    end

    def find_shop
      @shop = Shop.find_by(id: params[:id])
    end


end
