class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def shop_index
    # b-type/:idでのshops同じbussiness-typeのお店たち
    @some_shops = BussinessType.joins(categories: :shop_categories).select("bussiness_types.id", "categories.bussiness_type_id", "shop_categories.shop_id", "shop_categories.category_id").where(id: params[:id]).map { |result| result.shop_id }.shuffle.uniq

    # category/:idでのshops同じカテゴリーのお店たち

    # area/:idでのshops同じエリアのお店たち

    # searchs.indexでのshops

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
