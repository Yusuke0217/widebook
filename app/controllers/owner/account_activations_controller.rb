class Owner::AccountActivationsController < Owner::BaseController

  def edit
    owner = Owner.find_by(email: params[:email])
    if owner && !owner.activated? && owner.authenticated?(:activation, params[:id])
      owner.activate
      owner_log_in(owner)
      flash[:success] = "アカウントの有効化に成功しました。"
      redirect_to dashboards_path(owner)
    else
      flash[:danger] = "アカウントの有効化に失敗しました。"
      redirect_to root_url
    end
  end
end
