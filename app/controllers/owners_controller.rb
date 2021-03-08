class OwnersController < ApplicationController

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
      redirect_to root_path
    else
      render "new"
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

    def owner_params
      params.require(:owner).permit(:name, :email, :phone_number, :password)
    end

end
