class SessionsController < ApplicationController
  def new
  end

  def create
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
      flash.now[:danger] = "Error: Not Authenticated"
      render "new"
    end
  end

  def destroy
    if logged_in?
      log_out
    end
    redirect_to root_url
  end

end
