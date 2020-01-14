require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'it handles the tests related to user' do
    it 'valid user' do
      user = build(:user)
      expect(user).to be_valid
    end
    it 'expcts the user to be invalid' do
      user = build(:invalid_user)
      expect(user).to_not be_valid
    end

    describe 'association' do
      it { should have_many(:categories) }
      it { should have_many(:activities) }
    end

    describe 'validation' do
      it { should validate_presence_of(:email) }
      it { should validate_presence_of(:first_name) }
      it { should validate_presence_of(:last_name) }
    end

    describe 'user with actvities' do
      it 'checks count' do
        user = create(:user_with_activities, activity_count:4)
        expect(user.activities.count).to eq(4)
      end
    end
  end
end
