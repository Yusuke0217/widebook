module SessionsHelper

  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    elsif (user_id = cookies.signed[:user_id])
      user = User.find_by(id: user_id)
      if user && user.authenticated?(cookies[:remember_token])
        log_in(user)
        @current_user = user
      end
    end
  end 

  def remember(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end
  
  def logged_in?
    !current_user.nil?
  end

  def current_user?(user)
    user == current_user
  end

  def forget(user)
    user.update_attribute(:remember_digest, nil)
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  def log_out
    forget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end

  # アクセスしようとしたURLを覚えておく
  def url_location
    if request.get?
      session[:sending_url] = request.original_url
    end
  end

  def redirect_back_or(default)
    redirect_to(session[:sending_url] || default)
    session.delete(:sending_url)
  end

end
