class ShopCategory < ApplicationRecord
  
  belongs_to :shop
  belongs_to :category

  scope :join_c, -> { joins(:shop) }
  scope :choice_c, -> { select('shop_categories.*', 'shops.*') }
  scope :where_c_id, -> (params_id) { where(category_id: params_id) }
  scope :shops_ary, -> { map { |result| result.shop_id } }

  scope :c_shops, -> (params_id) { self.join_c.choice_c.where_c_id(params_id).shops_ary }
end
