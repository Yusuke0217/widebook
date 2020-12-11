class Review < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :shop, dependent: :destroy

  validates :title, length: { maximum: 50 }
  validates :content, length: { maximum: 200 }
  validates :score, presence: true
  validates :shop_id, uniqueness: { scope: :user_id}


  # --------------------------------------
  scope :join_shop, -> { joins(:shop)}
  scope :find_shop, -> (shop_num) { where(shop_id: shop_num)}
  scope :score_ary, -> { map { |s| s.score }}

  def self.shop_reviews(shop_num)
    self.join_shop.find_shop(shop_num).score_ary
  end

  # --------------------------------------

  def self.avg_score(scores)
    if scores.present?
      scores.inject(0) { |avg, score| avg + score } / scores.length
    else
      0.0
    end
  end
  
end
