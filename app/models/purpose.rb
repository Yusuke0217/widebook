class Purpose < ApplicationRecord
  has_many :shop_purposes
  has_many :shops, through: :shop_purposes

  mount_uploader :image, ImageUploader

  # -----------Purposeをidで検索するとき----
  scope :join_us, -> { eager_load(shop_purposes: :shop) }
  scope :p_search, -> (search_params) { where(id: search_params)}
  scope :shops_ary, -> { pluck(:shop_id) }

  scope :search, -> (search_params) { self.join_us.p_search(search_params).shops_ary }
  # --------------------------------------------

  # --------------------名前で検索されたとき----
  scope :purpose_search, -> (search_params) { where('purposes.name LIKE ?', "%#{search_params}%")}
  
  scope :k_word, -> (search_params) { self.join_us.purpose_search(search_params).shops_ary }
  # --------------------------------------------

  # ---------------------関連するお店(同じpurposeのお店)----------
  scope :rand_shops, -> (search_params) { self.join_us.p_search(search_params).shops_ary.shuffle }
  # --------------------------------------------
  
end
