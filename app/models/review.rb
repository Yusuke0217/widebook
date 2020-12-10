class Review < ApplicationRecord
  belongs_to :user
  belongs_to :shop

  validates :title, length: { maximum: 50 }
  validates :content, length: { maximum: 200 }
  validates :score, presence: true
  
end
