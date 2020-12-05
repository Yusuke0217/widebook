class Category < ApplicationRecord
  has_many :shop_categories
  has_many :shops, through: :shop_categories
  belongs_to :bussiness_type

  validates :name, presence: true, uniqueness: true

  # -----------------------
  
  scope :join_us, -> { joins(:shop_categories) }
  scope :choice, -> { select('categories.*, shop_categories.*')}
  scope :category_search, -> (search_params) { where('name LIKE ?', "%#{search_params}%")}
  scope :shops_ary, -> { map { |result| result.shop_id }}
  
  scope :search, -> (search_params) { self.join_us.choice.category_search(search_params).shops_ary }
  
  # -----------------------

  # scope :other_category, -> { where(:attibute => value)}

end
