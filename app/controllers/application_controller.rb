class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def shop_index
    # @shops = 
  end

  def logged_in_user
    unless logged_in?
      url_location
      flash[:danger] = 'ログインしてください'
      redirect_to login_url
    end
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
  
  def correct_user
    @user = User.find(params[:id]) || User.find_by(id: current_user.id)
    redirect_to root_url unless @user == current_user
  end
  
end
