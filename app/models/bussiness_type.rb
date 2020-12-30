class BussinessType < ApplicationRecord
  has_many :categories

  mount_uploader :image, ImageUploader

  # def self.search(search_params)
  #   self.find_by(id: search_params)
  # end

  # -----------Bussiness_typeをidで検索するとき----
  scope :join_us, -> { joins(categories: :shops) }
  scope :choice, -> { select('bussiness_types.*, categories.*, shops.*')}
  scope :b_search, -> (search_params) { where(id: search_params)}
  scope :shops_ary, -> { map { |result| result.id }}

  scope :search, -> (search_params) { self.join_us.choice.b_search(search_params).shops_ary }
  # --------------------------------------------

  # --------------------名前で検索されたとき----
  scope :join_type, -> { joins(categories: :shop_categories) }
  scope :select_column, -> { select("bussiness_types.id", "bussiness_types.name", "shop_categories.shop_id") }
  scope :b_type_search, -> (search_params) { where('bussiness_types.name LIKE ?', "%#{search_params}%")}
  scope :stores_ary, -> { map { |result| result.shop_id }}
  
  scope :k_word, -> (search_params) { self.join_type.select_column.b_type_search(search_params).stores_ary }
  # --------------------------------------------

  # --------------------------------------------
  scope :choice_ids, -> { select("bussiness_types.id", "categories.bussiness_type_id", "shop_categories.shop_id", "shop_categories.category_id") }
  scope :params_where, -> (id_params) { where(id: id_params) }

  scope :rand_shop, -> (id_params) { self.join_type.choice_ids.params_where(id_params).stores_ary}
  # --------------------------------------------
  
end
