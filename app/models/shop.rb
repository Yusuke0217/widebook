class Shop < ApplicationRecord
  has_many :bookmarks
  has_many :bookmark_users, through: :bookmarks, dependent: :destroy, source: :user
  has_many :shop_categories 
  has_many :categories, through: :shop_categories, dependent: :destroy
  # accepts_nested_attributes_for :shop_categories
  belongs_to :user
  mount_uploader :image, ImageUploader
  validates :user_id, presence: true
  validates :name, presence: true
  validates :content, length: { maximum: 2000 }
  validate :image_size
  validate :tag_size

  TAG_MAX = 3

  
  def bookmarked_by?(user)
    bookmarks.where(user_id: user.id).exists?
  end

  # def bookmarks
  #   @shops = current_user.bookmark_shops.includes(:user)
  # end

  private
  
    def image_size
      if image.size > 5.megabytes
        errors.add(:image, "写真は5MBまでです。")
      end
    end

    def tag_size
      if self.categories.size > TAG_MAX
        errors.add(:categories, "は、最大3つまでです。")
      elsif self.categories.blank?
        errors.add(:categories, "を選んでください。")
      end
    end

end
