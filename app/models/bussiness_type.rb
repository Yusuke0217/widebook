class BussinessType < ApplicationRecord
  has_many :categories

  mount_uploader :image, ImageUploader

  # -----------Bussiness_typeをidで検索するとき----
  scope :join_us, -> { eager_load(categories: :shop_categories) }
  scope :b_search, -> (search_params) { where(id: search_params)}
  scope :shops_ary, -> { pluck(:shop_id) }

  scope :search, -> (search_params) { self.join_us.b_search(search_params).shops_ary }
  # --------------------------------------------

  # --------------------名前で検索されたとき----
  scope :join_type, -> { joins(categories: :shop_categories) }
  scope :select_column, -> { select("bussiness_types.id", "bussiness_types.name", "shop_categories.shop_id") }
  scope :b_type_search, -> (search_params) { where('bussiness_types.name LIKE ?', "%#{search_params}%")}
  scope :stores_ary, -> { map { |result| result.shop_id }}
  
  scope :k_word, -> (search_params) { self.join_type.select_column.b_type_search(search_params).stores_ary }
  # --------------------------------------------

  # ---------------------関連するお店----------
  scope :choice_ids, -> { select("bussiness_types.id", "categories.bussiness_type_id", "shop_categories.shop_id", "shop_categories.category_id") }

  scope :rand_shops, -> (search_params) { self.join_type.choice_ids.b_search(search_params).stores_ary }
  # --------------------------------------------
  
end
