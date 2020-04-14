require 'rails_helper'

RSpec.describe Identifier, type: :model do
  it { should belong_to(:user) }

  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:key) }
  it { should validate_presence_of(:value) }
  # it { should validate_uniqueness_of(:key).scoped_to(:user_id) }
  it { should validate_numericality_of(:value).only_integer }
  it { should validate_numericality_of(:value).is_greater_than_or_equal_to(0) }
end
