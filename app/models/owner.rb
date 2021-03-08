class Owner < ApplicationRecord

  attr_accessor :remember_token, :activation_token, :reset_token
  has_many :shops

  before_save :downcase_email
  VALID_EMAIL_REGEX = %r{\A[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*\z}.freeze
  has_secure_password

  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }
  validates :phone_number, presence: true
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

  def downcase_email
    self.email = email.downcase
  end

  def self.digest(string)
    cost = if ActiveModel::SecurePassword.min_cost
             BCrypt::Engine::MIN_COST
           else
             BCrypt::Engine.cost
           end
    BCrypt::Password.create(string, cost: cost)
  end

  def self.new_token
    SecureRandom.urlsafe_base64
  end

  def remember_me
    self.remember_token = Owner.new_token
    update_attribute(:remember_digest, Owner.digest(remember_token))
  end

  def authenticated?(local_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(local_token)
  end

end
