class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def subscription_member
    @owner = current_owner
    if @owner.payment.nil? || @owner.payment.stripe_subscription_status == "canseled"
      flash[:danger] = 'こちらは有料会員限定です。有料会員に登録してください'
      redirect_to payment_path(@owner)
    end
  end

  def subscription_restart
    if current_owner.payment.present?
      redirect_to edit_payment_path(current_owner)
    end
  end


  def logged_in_user
    unless logged_in?
      url_location
      flash[:danger] = 'ログインしてください'
      redirect_to login_url
    end
  end

  def logged_in_owner
    unless owner_logged_in?
      url_location
      flash[:danger] = 'ログインしてください'
      redirect_to owner_login_url
    end
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
  
  def correct_user
    @user = User.find(params[:id]) || User.find_by(id: current_user.id)
    redirect_to root_url unless @user == current_user
  end

  def correct_owner
    # @owner = Owner.find_by(id: current_owner.id) || Owner.find(params[:id])
    @owner =  Owner.find(params[:id]) || Owner.find_by(id: current_owner.id)
    redirect_to root_url unless @owner == current_owner
  end

  def ua
    ua = request.env["HTTP_USER_AGENT"]
  end
  
end
