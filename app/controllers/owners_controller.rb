class OwnersController < ApplicationController
  before_action :find_owner, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
  end

  def new
    @owner = Owner.new
  end

  def create
    @owner = Owner.new(owner_params)
    if @owner.save
      flash[:success] = "メールを確認し、アカウントの有効化を行ってください。"
      redirect_to owner_dashbords_path(@owner)
    else
      render "new"
    end
  end

  def edit
  end

  def update
    if @owner.update_attributes(owner_params)
      flash[:success] = "プロフィールを更新しました"
      redirect_to owner_url(@owner)
    else
      render "edit"
    end
  end

  def destroy
  end

  private

    def owner_params
      params.require(:owner).permit(:name, :email, :phone_number, :password, :image)
    end

    def find_owner
      @owner = Owner.find_by(id: params[:id])
    end

end