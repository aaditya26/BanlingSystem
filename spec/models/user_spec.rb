require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = FactoryGirl.create(:user)
    @user= FactoryGirl.create(:user, name: @user.name)
  end
  describe '#valid_password?' do
    let!(:user) { create(:user) }
    let(:password) { user.password }

    context 'with valid password' do
      it 'returns true' do
        expect(user.valid_password?(password)).to eq true
      end
    end

    context 'with invalid password' do
      let(:invalid_password) { '22345678' }

      it 'returns false' do
        expect(user.valid_password?(invalid_password)).to eq false
      end
    end
  end
  describe '#create' do
    context 'with valid params' do
      let(:params) { { email: 'aaditya.gits@gmail.com', password: '12345678' } }

      it 'returns created user' do
        @user = described_class.create!(params)
        expect(@user.name).not_to eq nil
      end
    end

    context 'with invalid params' do
      let(:without_email) { { password: '12345678' } }
      let(:without_password) { { email: 'aditya.gitp@gmail.com' } }

      it 'validates presence of email attribute' do
        expect{described_class.create!(without_email)}.to raise_error ActiveRecord::RecordInvalid
      end

      it 'validates presence of password attribute' do
        expect{described_class.create!(without_password)}.to raise_error ActiveRecord::RecordInvalid
      end
    end
  end

  it 'should invalid without name'do
    FactoryGirl.build(:user, name: name).should be_valid
  end
  it 'should invalid without name'do
    FactoryGirl.build(:user, name: nil).should_not be_valid
  end

  it 'should invalid without a address' do
    FactoryGirl.build(:user, address: nil).should_not be_valid
  end

  it 'with valid a address' do
    FactoryGirl.build(:user, address: address).should be_valid
  end

  context 'bank associations' do
    it 'should has many users' do
      @bank = FactoryGirl.create(:school)
      @user1 = FactoryGirl.create(:user, name: @user.name)
      @user2 = FactoryGirl.create(:user, name: @user.name)
      @bank.user.should include @user1
      @bank.classrooms.should include @user2
    end
  end
end
