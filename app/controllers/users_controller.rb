class UsersController < ApplicationController
  before_action :logged_in_user, only: %i[index show edit update destroy]
  before_action :correct_user, only: %i[edit update]
  before_action :admin_user, only: :destroy
  before_action :find_user, only: [:show, :edit, :update, :destroy]

  def index
  end

  def new
    @user = User.new
  end

  def show
    unless @user.activated?
      redirect_to root_url and return
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save

      # @user.send_activation_email
      @user.activate
      log_in(@user)
      
      # flash[:info] = 'メールを確認し、アカウントを有効化してください。'
      # redirect_to root_url
      flash[:info] = 'アカウントを作成しました！'
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = 'プロフィール情報を更新しました'
      redirect_to user_url(@user)
    else
      render 'edit'
    end
  end

  def destroy
    flash[:success] = 'Deleted!'
    redirect_to root_url
  end

  def privacy
  end

  def rule
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :image)
  end

  def find_user
    @user = User.find(params[:id])
  end



end
