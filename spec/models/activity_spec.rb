require 'rails_helper'

RSpec.describe Activity, type: :model do
  describe 'vaidations' do
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_least(4) }

    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:country) }
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:category_id) }
  end

  describe 'associations' do
    it { should belong_to(:owner) }
    it { should belong_to(:category) }
  end
end
