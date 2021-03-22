class DashboardsController < ApplicationController
  before_action :logged_in_owner, only: [:show]
  before_action :correct_owner, only: [:show]

  def show
    @owner = Owner.find_by(id: params[:id])
    @shops = Shop.where(owner_id: @owner.id)
    @data = @shops.map { |shop| { name: shop.name, data: shop.impressions.group_by_day(:created_at).count }}
    # @data_week = @shops.map { |shop| { name: shop.name, data: shop.impressions.group_by_week(:created_at).count }}
    # @data_month = @shops.map { |shop| { name: shop.name, data: shop.impressions.group_by_week(:created_at).count }}
  end
end
