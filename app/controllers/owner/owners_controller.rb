class Owner::OwnersController < Owner::BaseController

  def new
    @owner = Owner.new
  end

  def create
    @owner = Owner.new(owner_params)
    if @owner.save
      flash[:success] = "メールを確認し、アカウントの有効化を行ってください。"
      redirect_to owner_dashboards_path(@owner)
    else
      render "new"
    end
  end

  private

    def owner_params
      params.require(:owner).permit(:name, :email, :phone_number, :password, :image)
    end

end
