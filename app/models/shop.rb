class Shop < ApplicationRecord
  has_many :bookmarks
  has_many :bookmark_users, through: :bookmarks, dependent: :destroy, source: :user
  has_many :shop_categories 
  has_many :categories, through: :shop_categories, dependent: :destroy
  has_many :reviews
  has_many :review_users, through: :reviews, source: :user
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images
  has_many :mediums, dependent: :destroy
  accepts_nested_attributes_for :mediums
  has_many :shop_purposes
  has_many :purposes, through: :shop_purposes, dependent: :destroy
  accepts_nested_attributes_for :purposes
  has_many :shop_cards
  has_many :pay_cards, through: :shop_cards, dependent: :destroy
  belongs_to :user
  belongs_to :area
  validates :user_id, presence: true
  validates :name, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true
  validates :content, length: { maximum: 2000 }
  validates :holidays, presence: true
  validates :b_hours_first, presence: true
  validates :b_hours_last, presence: true
  validates :budget, presence: true
  validate :tag_size

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  TAG_MAX = 3

  
  def bookmarked_by?(user)
    if user.present?
      bookmarks.where(user_id: user.id).exists?
    end
  end

  def self.search(search_params)
    if search_params.present?
      self.where('name LIKE ?', "%#{search_params}%")
    else
      self.all
    end
  end

  # -----------カテゴリのshop_indexページ用------------------
  scope :join_us, -> { eager_load(:shop_categories) }
  scope :where_c_id, -> (params_id) { where(shop_categories: {category_id: params_id} ) }
  scope :shops_ary, -> { pluck(:id) }

  scope :c_shops, -> (params_id) { self.join_us.where_c_id(params_id).shops_ary }
  # ---------------------------------------

  # ------------B-typeのshop_indexページ用---------------
  scope :join_p, -> { eager_load(shop_purposes: :purpose) }
  scope :where_p_id, -> (params_id) { where(shop_purposes: { purpose_id: params_id }) }

  scope :p_shops, -> (params_id) { self.join_p.where_p_id(params_id).shops_ary}
  # ---------------------------------------

  
  private

    def tag_size
      if self.categories.size > TAG_MAX
        errors.add(:categories, "は、最大3つまでです。")
      elsif self.categories.blank?
        errors.add(:categories, "を選んでください。")
      end
    end

end
