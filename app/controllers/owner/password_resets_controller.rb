class Owner::PasswordResetsController < ApplicationController
  def new
  end

  def edit
    @owner = Owner.find_by(id: params[:id])
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
  end
end
