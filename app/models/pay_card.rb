class PayCard < ApplicationRecord
  has_many :shop_cards
  has_many :shops, through: :shop_cards

  validates :name, presence: true, uniqueness: true
end
