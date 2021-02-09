class Menu < ApplicationRecord
  belongs_to :shop
  belongs_to :menu_type

  with_options presence: true do
    validates :name
    validates :price, length: { maximum: 99999 }
    validates :menu_type_id
    validates :availability, inclusion: { in: [true, false] }
  end
  
end
