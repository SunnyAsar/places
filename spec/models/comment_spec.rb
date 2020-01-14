require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'Associations' do
    it { should belong_to(:commenter) }
    it { should belong_to(:activity) }
  end

  describe 'validations' do
    it { should validate_presence_of(:content) }
  end
end
