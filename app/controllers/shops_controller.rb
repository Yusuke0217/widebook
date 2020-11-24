class ShopsController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :admin_user, except: [:show, :index]
  # indexアクションは、後ほど管理者のみ見ることができるようにする。

  def index
    @shops = Shop.includes(:user).all
  end

  def new
    @shop = Shop.new
  end
  
  def show
    @shop = Shop.find_by(id: params[:id])
    @shop_categories = ShopCategory.where(shop_id: @shop.id)
    @shop_category = @shop_categories.map { |tag|
      tag.category_id
    }
    @categories = Category.where(id: @shop_category)
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
    @shop = Shop.find_by(id: params[:id])
  end

  def update
    @shop = Shop.find_by(id: params[:id])
    if @shop.update_attributes(shop_params)
      flash[:success] = "お店の情報を更新しました。"
      redirect_to shop_path(@shop)
    else
      render "edit"
    end
  end

  def destroy
    @shop = Shop.find(params[:id])
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
      # params.require(:shop).permit(:name, :address, :phone_number, :content, :image, { category_ids: [] } )
      params.require(:shop).permit(:name, :address, :phone_number, :content, :image, { category_ids: [] } )
    end

end
