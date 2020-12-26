class Image < ApplicationRecord
  belongs_to :shop

  mount_uploader :image, ImageUploader

  validates :image, length: {maximum: 10}
  validate :image_size

  private

    def image_size
      if image.size > 5.megabytes
        errors.add(:image, "写真は5MBまでです。")
      end
    end

end
