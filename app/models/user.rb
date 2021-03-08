class User < ApplicationRecord
  attr_accessor :remember_token, :activation_token, :reset_token
  has_many :bookmarks
  has_many :bookmark_shops, through: :bookmarks, dependent: :destroy, source: :shop
  has_many :reviews
  has_many :review_shops, through: :reviews, source: :shop
  before_save :downcase_email
  before_create :create_activation_digest
  VALID_EMAIL_REGEX = %r{\A[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*\z}.freeze
  has_secure_password
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
  mount_uploader :image, ImageUploader

  def self.digest(string)
    cost = if ActiveModel::SecurePassword.min_cost
             BCrypt::Engine::MIN_COST
           else
             BCrypt::Engine.cost
           end
    BCrypt::Password.create(string, cost: cost)
  end

  # ランダムなトークンを返す
  def self.new_token
    SecureRandom.urlsafe_base64
  end

  # 永続セッションのためにユーザーをデータベースに記憶する
  def remember_me
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  # 渡されたトークンがダイジェストと一致したらtrueを返す
  def authenticated?(attribute, local_token)
    digest = self.send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(local_token)
  end

  def downcase_email
    self.email = email.downcase
  end

  def send_activation_email
    UserMailer.account_activation(self).deliver_now
  end

  def activate
    self.update_columns(activated: true, activated_at: Time.zone.now)
  end

  def create_activation_digest
    self.activation_token = User.new_token
    self.activation_digest = User.digest(activation_token)
  end

  def create_reset_digest
    self.reset_token = User.new_token
    update_columns(reset_digest: User.digest(reset_token), reset_sent_at: Time.zone.now)
  end

  def send_password_reset_email
    UserMailer.password_reset(self).deliver_now
  end

  def pasword_reset_expired
    reset_sent_at < 2.hours.ago
  end


  # ----------------------------------------
  scope :reviewer_table, -> { joins(:reviews) }
  scope :choice_clm, -> { select('reviews.*') }
  scope :user_ary, -> { map { |u| u.user_id } }

  def self.reviewers_find
    self.reviewer_table.choice_clm.user_ary
  end
  # -----------------------------------------

end
