class UsersController < ApplicationController
  before_action :logged_in_user, only: %i[edit update destroy]
  before_action :correct_user, only: %i[edit update]
  before_action :admin_user, only: :destroy

  def index; end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    unless @user.activated?
      redirect_to root_url and return
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      flash[:info] = 'メールを確認し、アカウントを有効化してください。'
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = 'プロフィール情報を更新しました'
      redirect_to user_url(@user)
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = 'Deleted!'
    redirect_to root_url
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to root_url unless @user == current_user
  end

end
