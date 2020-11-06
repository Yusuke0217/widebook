class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in(user)
      remember(user)
      redirect_to user_url(user)
    else
      flash.now[:danger] = "Error: Not Authenticated"
      render "new"
    end
  end

  def destroy
    if user.logged_in?
      log_out
    end
    redirect_to root_url
  end

end
