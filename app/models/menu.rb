class Menu < ApplicationRecord
  belongs_to :shop
  belongs_to :menu_type
end
