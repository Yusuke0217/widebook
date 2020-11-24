class Category < ApplicationRecord
  has_many :shop_categories
  has_many :shops, through: :shop_categories

  validates :name, presence: true, uniqueness: true
end
