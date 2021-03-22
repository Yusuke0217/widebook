class ShopsController < ApplicationController

  before_action :logged_in_owner, only: [:new, :edit, :update, :destroy]
  # before_action :admin_user, only: [:new, :edit, :create, :update, :destroy]
  before_action :find_shop, only: [:edit, :update, :show, :destroy]

  def index
    @c_shops = Shop.c_shops(params[:num])
    @p_shops = Shop.p_shops(params[:num])
    
    if params[:detail] == 'category'
      @shops = Shop.where(id: @c_shops).page(params[:page]).per(20)
    elsif params[:detail] == 'purpose'
      @shops = Shop.where(id: @p_shops).page(params[:page]).per(20)
    elsif params[:detail] == 'shop'
      @shops = Shop.all.page(params[:page]).per(20)
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
    @f_menus = Menu.f_menu(params[:id]).page(params[:page]).per(10)
    @d_menus = Menu.d_menu(params[:id]).page(params[:page]).per(10)
    gon.shop = @shop

    impressionist(@shop, nil, unique: [:session_hash])
  end
  
  def create
    @owner = Owner.find_by(id: current_owner.id)
    @shop = @owner.shops.build(shop_params)
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
      params.require(:shop).permit(:name, :address, :address_building, :phone_number, :content, :booking, :area_id, :budget, :holidays, :b_hours_first, :b_hours_last, { category_ids: [] }, { purpose_ids: [] }, { pay_card_ids: [] }, images_attributes: [:image, :id], mediums_attributes: [:home_page, :facebook, :instagram, :twitter], menus_attributes: [:name, :price, :menu_type_id])
    end

    def find_shop
      @shop = Shop.find_by(id: params[:id])
    end


end
