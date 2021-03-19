class Owner::ShopsController < Owner::BaseController

  def show
    @owner = Owner.find_by(id: params[:owner_id])
    @shops = Shop.where(owner_id: @owner.id).page(params[:page]).per(20)
  end
  
end
