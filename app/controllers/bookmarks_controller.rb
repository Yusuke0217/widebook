class BookmarksController < ApplicationController

  before_action :logged_in_user

  def new
  end

  def index
  end

  def show
    @user = User.find_by(id: current_user.id)
    @bookmarks = @user.bookmark_shops
  end

  def create
    @user = User.find(current_user.id)
    @shop = Shop.find(params[:shop_id])
    @bookmark = @user.bookmarks.build(shop_id: @shop.id)
    if @bookmark.save
      redirect_to shop_path(@shop)
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @user = User.find(current_user.id)
    @shop = Shop.find(params[:shop_id])
    @bookmark = Bookmark.find_by(shop_id: @shop.id, user_id: @user.id)
    if @bookmark.destroy
      redirect_to shop_path(@shop)
    end
  end

  private

end
