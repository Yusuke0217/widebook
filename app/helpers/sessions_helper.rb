module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
  end

  def owner_log_in(owner)
    session[:owner_id] = owner.id
  end

  def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    elsif (user_id = cookies.signed[:user_id])
      user = User.find_by(id: user_id)
      if user && user.authenticated?(:remember, cookies[:remember_token])
        log_in(user)
        @current_user = user
      end
    end
  end

  def current_owner
    if (owner_id = session[:owner_id])
      @current_owner ||= Owner.find_by(id: owner_id)
    elsif (owner_id = cookies.signed[:owner_id])
      owner = Owner.find_by(id: owner_id)
      if owner && owner.authenticated?(:remember, cookies[:remember_token])
        owner_log_in(owner)
        @current_owner = owner
      end
    end
  end

  def remember(user)
    user.remember_me
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  def remember_owner(owner)
    owner.remember_me
    cookies.permanent.signed[:owner_id] = owner.id
    cookies.permanent[:remember_token] = owner.remember_token
  end

  def logged_in?
    !current_user.nil?
  end

  def owner_logged_in?
    !current_owner.nil?
  end

  def current_user?(user)
    user == current_user
  end

  def current_owner?(owner)
    owner == current_owner
  end

  def forget(user)
    user.update_attribute(:remember_digest, nil)
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  def owner_forget(owner)
    owner.update_attribute(:remember_digest, nil)
    cookies.delete(:owner_id)
    cookies.delete(:remember_token)
  end

  def log_out
    forget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end

  def owner_log_out
    owner_forget(current_owner)
    session.delete(:owner_id)
    @current_owner = nil
  end

  # アクセスしようとしたURLを覚えておく
  def url_location
    session[:sending_url] = request.original_url if request.get?
  end

  def redirect_back_or(default)
    redirect_to(session[:sending_url] || default)
    session.delete(:sending_url)
  end

  def takeout?(shop)
    @shop = shop
    @shop.purposes.pluck(:name).include?("テイクアウト")
  end

  def delivery?(shop)
    @shop = shop
    @shop.purposes.pluck(:name).include?("デリバリー・宅配")
  end
end
