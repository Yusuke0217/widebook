class MenusController < ApplicationController
  before_action :logged_in_user, only: [:new, :edit, :create, :destroy, :update]
  before_action :admin_user, only: [:new, :edit, :create, :destroy, :update]

  def show
  end

  def new
  end

  def edit
  end

  def create
  end

  def destroy
  end

  def update
  end

  private
end
