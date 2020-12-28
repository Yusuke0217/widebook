class BussinessType < ApplicationRecord
  has_many :categories

  mount_uploader :image, ImageUploader

  # def self.search(search_params)
  #   self.find_by(id: search_params)
  # end

  scope :join_us, -> { joins(categories: :shops) }
  scope :choice, -> { select('bussiness_types.*, categories.*, shops.*')}
  scope :b_search, -> (search_params) { where(id: search_params)}
  scope :shops_ary, -> { map { |result| result.id }}

  scope :search, -> (search_params) { self.join_us.choice.b_search(search_params).shops_ary }
  
  
end
