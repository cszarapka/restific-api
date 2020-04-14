class User < ApplicationRecord
  has_secure_password

  # Validations
  validates_presence_of :name, :email, :password_digest
  validates :email, uniqueness: { case_sensitive: false }
end
