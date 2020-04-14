class Identifier < ApplicationRecord
  belongs_to :user

  # Validations
  validates_presence_of :user_id, :key, :value
  validates :key, uniqueness: { scope: :user_id }
  validates_numericality_of :value, only_integer: true, greater_than_or_equal_to: 0
end
