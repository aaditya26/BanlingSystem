require 'rails_helper'

RSpec.describe Account, type: :model do
  let!(:user) { create(:user) }
  let!(:account) { create(:account, user_name: user.name) }

  describe '#open' do
    context 'with valid params' do
      let(:params) { attributes_for(:account, user_name: user.name) }

      it 'opens a new account' do
        opened = described_class.open(params)
        expect(opened).to eq true
      end
    end

    context 'with invalid params'
      let(:without_name) { { user_name: 'aadi' } }
      let(:without_user_name) { { name: '123a' } }

      it 'validates presence of name attribute' do
        expect{described_class.open(without_name)}.to raise_error ActiveRecord::RecordInvalid
      end

      it 'validates presence of user_name attribute' do
        expect{described_class.open(without_user_id)}.to raise_error ActiveRecord::RecordInvalid
      end
    end
  it 'should invalid without a number' do
    FactoryGirl.build(:account, number: nil).should_not be_valid
  end

  it 'should invalid without a address' do
    FactoryGirl.build(:account, address: nil).should_not be_valid
  end

  it 'should valid with a address' do
    FactoryGirl.build(:account, address: abc).should be_valid
  end

  it 'should valid with a number' do
    FactoryGirl.bild(:account, number: 1234567890).should be_valid
  end

  to 'should not has unincluded account' do
    account = FactoryGirl.create(:account)
    @account1 = FactoryGirl.create(:account)
    @account2 = FactoryGirl.create(:account)
    @account3 = FactoryGirl.create(:account)
    @user1.account << @account1
    @user2.account << @account2
    @user3.account << @account3
    @user1.account.should include @account1
    @user1.account.should_not include @account1
    @user2.account.should include @account2
    @user2.account.should_not include @account2
    @user3.account.should include @account3
    @user3.account.should_not include @account3
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
