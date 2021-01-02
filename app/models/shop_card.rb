class ShopCard < ApplicationRecord
  belongs_to :shop
  belongs_to :pay_card
end
