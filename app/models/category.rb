class Category < ApplicationRecord
  has_many :shop_categories
  has_many :shops, through: :shop_categories
  belongs_to :bussiness_type

  validates :name, presence: true, uniqueness: true

  # -----------------------
  
  scope :join_us, -> { joins(:shop_categories) }
  scope :choice, -> { select('categories.id', 'shop_categories.shop_id')}
  scope :category_search, -> (search_params) { where('name LIKE ?', "%#{search_params}%")}
  scope :shops_ary, -> { map { |result| result.shop_id }}
  
  scope :search, -> (search_params) { self.join_us.choice.category_search(search_params).shops_ary }
  
  # -----------------------

  scope :join_b, -> { joins(shop_categories: :shop) }
  scope :choice_b, -> { select('shops.*', 'shop_categories.shop_id', 'categories.bussiness_type_id') }
  scope :where_b_id, -> (params_id) { where(bussiness_type_id: params_id) }

  scope :b_shops, -> (params_id) { self.join_b.choice_b.where_b_id(params_id).shops_ary}

end
