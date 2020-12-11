class ReviewsController < ApplicationController
  # before_action :logged_in_user, only: [:new, :edit, :update, :destroy]
  # before_action :correct_user, only: %i[new edit update destroy]

  def index
  end

  def show
  end

  def new
    @user = User.find(current_user.id)
    @shop = Shop.find_by(id: params[:shop_id])
    @review = Review.new
  end

  def create
    @user = User.find(current_user.id)
    @shop = Shop.find_by(id: params[:shop_id])
    @review = @user.reviews.build(review_params)
    if @review.save
      flash[:success] = "レビューを投稿しました"
      redirect_to shop_path(@shop)
    else
      render "new"
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
    def review_params
      params.require(:review).permit(:title, :content, :score, :shop_id)
    end

end
