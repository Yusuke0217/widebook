class Shop < ApplicationRecord
  belongs_to :user
  mount_uploader :image, ImageUploader
  validates :user_id, presence: true
  validates :name, presence: true
  # validates :address, presence: true
  validates :content, length: { maximum: 2000 }
  validate :image_size

  private

    def image_size
      if image.size > 5.megabytes
        errors.add(:image, "写真は5MBまでです。")
      end
    end

end
