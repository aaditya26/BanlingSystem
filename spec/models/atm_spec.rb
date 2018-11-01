require 'rails_helper'

RSpec.describe Atm, type: :model do
  context 'atm validation' do
    it 'has valid factory' do
      expect(FactoryBot.create(:atm)).to be_valid
    end

    it 'should invalid without a locaton' do
      expect(FactoryBot.build(:atm, location: nil)).no_to be_valid
    end

    it 'should invalid without bank' do
      expect(FactoryBot.build(:atm, nanknmae: nil)).should_not be_valid
    end
  end

  it 'should has many transaction' do
    account = FactoryGirl.create(:account)
    @transaction = FactoryGirl.create(:transaction)
    @user1 = FactoryGirl.create(:user, name: name)
    @user2 = FactoryGirl.create(:user, name: name)
    @transaction.users << @user1
    @transaction.users << @user2
    @transaction.users.should include @user1
    @transaction.users.should include @user2
  end
  it 'should not has unincluded transaction' do
    account = FactoryGirl.create(:account)
    @transaction1 = FactoryGirl.create(:transaction)
    @transaction2 = FactoryGirl.create(:transaction)
    @user1 = FactoryGirl.create(:user, name: name)
    @user2 = FactoryGirl.create(:user, name: name)
    @transaction1.users << @user1
    @transaction2.users << @user2
    @transaction1.users.should include @user1
    @transaction1.users.should_not include @user2
    @transaction2.users.should include @user2
    @transaction2.users.should_not include @user1
  end
end
