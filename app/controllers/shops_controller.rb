class ShopsController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :admin_user, except: [:show]

  def index
    @shops = Shop.all
  end

  def new
    @shop = Shop.new
  end
  
  def show
    @shop = Shop.find_by(id: params[:id])
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
      params.require(:shop).permit(:name, :address, :phone_number, :content, :image)
    end

end
