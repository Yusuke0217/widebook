class Shop < ApplicationRecord
  has_many :bookmarks
  has_many :bookmark_users, through: :bookmarks, dependent: :destroy, source: :user
  belongs_to :user
  mount_uploader :image, ImageUploader
  validates :user_id, presence: true
  validates :name, presence: true
  # validates :address, presence: true
  validates :content, length: { maximum: 2000 }
  validate :image_size


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

end
