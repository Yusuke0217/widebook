class BussinessType < ApplicationRecord
  has_many :categories

  mount_uploader :image, ImageUploader
end
