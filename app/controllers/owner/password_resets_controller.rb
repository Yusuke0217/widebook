class Owner::PasswordResetsController < ApplicationController

  before_action :get_owner, only: [:edit, :update]
  before_action :valid_owner, only: [:edit, :update]
  before_action :check_expiration, only: [:edit, :update]

  def new
  end

  def edit
  end

  def create
    @owner = Owner.find_by(email: params[:password_reset][:email].downcase)
    if @owner
      @owner.create_reset_digest
      @owner.send_password_reset_email
      flash[:info] = "パスワード再設定用のメールを送信しました。"
      redirect_to root_url
    else
      flash[:danger] = "メールアドレスが見つかりませんでした。"
      render "new"
    end
  end

  def update
    if params[:owner][:password].empty?
      @owner.errors.add(:password, :blank)
      render "edit"
    elsif @owner.update_attributes(owner_params)
      owner_log_in(@owner)
      flash[:success] = "パスワードを更新しました。"
      redirect_to dashboards_path(@owner)
    else
      render "edit"
    end
  end

  private

    def get_owner
      @owner = Owner.find_by(email: params[:email])
    end

    def valid_owner
      unless (@owner && @owner.activated? && @owner.authenticated?("reset", params[:id]))
        redirect_to root_url
      end
    end

    def check_expiration
      if @owner.password_reset_expired?
        flash[:danger] = "リンクの有効期限が切れています。"
        redirect_to new_owner_password_reset_url
      end
    end

    def owner_params
      params.require(:owner).permit(:password)
    end

end
