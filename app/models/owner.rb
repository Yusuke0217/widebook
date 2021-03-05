class Owner < ApplicationRecord
  
  hs_many :shops

  before_save :downcase_email
  VALID_EMAIL_REGEX = %r{\A[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*\z}.freeze
  has_secure_password

  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }
  validates :phone_number, presence: true
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

end
