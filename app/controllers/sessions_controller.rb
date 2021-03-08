class SessionsController < ApplicationController
  def new
  end

  def create
    if params[:agent] == 'user'
      user = User.find_by(email: params[:session][:email].downcase)
      if user && user.authenticate(params[:session][:password])
        if user.activated?
          log_in(user)
          remember(user)
          redirect_back_or(user)
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
    elsif params[:agent] == 'owner'
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
  end

  def destroy
    if params[:agent] == 'user'
      if logged_in?
        log_out
      end
    elsif params[:agent] == 'owner'
      if owner_logged_in?
        owner_log_out
      end
    end
    redirect_to root_url
  end

end
