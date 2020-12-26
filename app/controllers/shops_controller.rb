class ShopsController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :show, :update, :destroy]
  # indexアクションは、後ほど管理者のみ見ることができるようにする。
  before_action :admin_user, except: [:show, :index]
  before_action :find_shop, only: [:edit, :update, :show, :destroy]

  def index
    @shops = Shop.includes(:user).all
  end

  def new
    @shop = Shop.new
    10.times{@shop.images.build}
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
      redirect_to request.referrer || root_url
    else
      flash[:danger] = "削除に失敗しました。"
      render "shops#index"
    end
  end


  private

    def shop_params
      params.require(:shop).permit(:name, :address, :address_building, :phone_number, :content, :booking, :area_id, { category_ids: [] }, images_attributes: [:image, :id] )
    end

    def find_shop
      @shop = Shop.find_by(id: params[:id])
    end


end
