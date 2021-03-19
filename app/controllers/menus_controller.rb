class MenusController < ApplicationController

  before_action :logged_in_owner, only: [:new, :edit, :create, :destroy, :update]
  # before_action :admin_user, only: [:new, :edit, :create, :destroy, :update]
  before_action :find_shop, only: [:new, :create]

  def show
  end

  def new
    @form = Form::MenuCollection.new
  end

  def edit
  end

  def create
    @form = Form::MenuCollection.new(menu_params)
    if @form.save
      flash[:success] = "メニューを投稿しました。"
      redirect_to shop_path(id: @shop.id)
    else
      render "new"
    end
  end

  def destroy
  end

  def update
  end

  private

    def menu_params
      params.require(:form_menu_collection).permit(menus_attributes: [:name, :price, :menu_type_id, :availability, :shop_id])
    end

    def find_shop
      @shop = Shop.find_by(id: params[:shop_id])
    end
end
