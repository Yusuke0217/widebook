class BussinessType < ApplicationRecord
  has_many :categories

  mount_uploader :image, ImageUploader

  # def self.search(search_params)
  #   self.find_by(id: search_params)
  # end

  scope :join_us, -> { joins(categories: :shop_categories) }
  scope :choice, -> { select('categories.*, shop_categories.*')}
  scope :b_search, -> (search_params) { where(id: search_params)}
  scope :shops_ary, -> { map { |result| result.shop_id }}

  scope :search, -> (search_params) { self.join_us.choice.b_search(search_params).shops_ary }
  
  
end
