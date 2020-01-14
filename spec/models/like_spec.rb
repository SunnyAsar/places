require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:liker_id) }
  end

  describe 'associations' do
    it { should belong_to(:liker) }
    it { should belong_to(:likable) }
  end
end
