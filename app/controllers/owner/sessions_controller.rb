class Owner::SessionsController < Owner::BaseController
  
  def new
  end

  def create
    owner = Owner.find_by(email: params[:session][:email].downcase)
    if owner && owner.authenticate(params[:session][:password])
      if owner.activated?
        owner_log_in(owner)
        remember_owner(owner)
        redirect_back_or(owner)
      else
        message = "アカウントが有効化されていません。"
        message += "メールを確認してください。"
        flash[:warning] = message
        redirect_to root_url
      end
    else
      flash.now[:danger] = "Error: アカウントの認証に失敗しました"
      render "new"
    end
  end

  def destroy
    if owner_logged_in?
      owner_log_out
    end
    redirect_to root_url
  end
end
