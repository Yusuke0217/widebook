class Owner < ApplicationRecord

  attr_accessor :remember_token, :activation_token, :reset_token

  before_save :downcase_email
  before_create :create_activation_digest

  has_many :shops

  VALID_EMAIL_REGEX = %r{\A[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*\z}.freeze
  has_secure_password

  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }
  validates :phone_number, presence: true
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
  mount_uploader :image, ImageUploader

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

  def authenticated?(attribute, local_token)
    digest = self.send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(local_token)
  end

  def activate
    self.update_columns(activated: true, activated_at: Time.zone.now)
  end

  def send_activation_email
    Owner::UserMailer.account_activation(self).deliver_now
  end
  

  private
  
    def create_activation_digest
      self.activation_token = Owner.new_token
      self.activation_digest = Owner.digest(activation_token)
    end

end
