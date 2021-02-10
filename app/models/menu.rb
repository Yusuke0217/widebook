class Menu < ApplicationRecord
  belongs_to :shop
  belongs_to :menu_type

  validates :name, presence: true
  validates :price, presence: true, length: { maximum: 99999 }
  validates :menu_type_id, presence: true
  validates :availability, inclusion: { in: [true, false] }

# ------------------------------------------------

  scope :shop_sync, -> (params_id) { where(shop_id: params_id)}
  scope :food, -> { where(menu_type_id: 1)}
  scope :drink, -> { where(menu_type_id: 2)}

  scope :f_menu, -> (params_id) { self.shop_sync(params_id).food }
  scope :d_menu, -> (params_id) { self.shop_sync(params_id).drink }
  
# ------------------------------------------------
end
