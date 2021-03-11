class DashboardsController < ApplicationController
  before_action :logged_in_owner, only: [:show]
  before_action :correct_owner, only: [:show]

  def show
    @owner = Owner.find_by(id: params[:id])
  end
end
