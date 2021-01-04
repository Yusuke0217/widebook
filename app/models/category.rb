class Category < ApplicationRecord
  has_many :shop_categories
  has_many :shops, through: :shop_categories
  belongs_to :bussiness_type

  validates :name, presence: true, uniqueness: true

  # ------------名前で検索されたとき-----------
  scope :join_us, -> { eager_load(:shop_categories) }
  scope :category_search, -> (search_params) { where('name LIKE ?', "%#{search_params}%")}
  scope :shops_ary, -> { pluck(:shop_id) }
  
  scope :search, -> (search_params) { self.join_us.category_search(search_params).shops_ary }
  
  # ----------------------------

end
