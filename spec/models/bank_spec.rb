require 'rails_helper'

RSpec.describe Bank, type: :model do
  context 'bank validation' do
    it 'should valid bank' do
      FactoryGirl.build(:bank).should be_valid
    end

    it 'should invalid without a name' do
      FactoryGirl.build(:bank, name: nil).should_not be_valid
    end

    it 'should invalid without a address' do
      FactoryGirl.build(:bank, address: nil).should_not be_valid
    end

    it 'should invalid without a number' do
      FactoryGirl.build(:bank, number: nil).should_not be_valid
    end

    it 'should invalid with invalid number' do
      FactoryGirl.build(:bank, number: Faker::Name.name).should_not be_valid
    end

    it 'should invalid with long number' do
      FactoryGirl.build(:bank, number: Faker::Name.number(17)).should_not be_valid

    end

    it 'should invalid without a code' do
      FactoryGirl.build(:bank, code: nil).should_not be_valid
    end
  end
end
