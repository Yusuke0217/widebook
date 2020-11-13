class Shop < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :name, presence: true
  validates :address, presence: true
  validates :content, length: { maximum: 2000 }

end
