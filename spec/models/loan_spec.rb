require 'rails_helper'

RSpec.describe Loan, type: :model do
  describe '#loan' do
    context 'loan validation' do
      it 'is a valid factory' do
      expect(FactoryBot.create(:loan)).to be_valid
    end
    end
  end

  it 'is invalid without amount' do
      expect(FactoryBot.build(:loan, amount: nil)).not_to be_valid
    end
    it 'is invalid without rate' do
      expect(FactoryBot.build(:loan, rate: nil)).to be_invalid
    end

    it 'has valid type' do
      expect(FactoryBot.build(:loan, loan_type: Education_Loan)).to be_valid
    end
    it 'has valid loan_type' do
      expect(FactoryBot.build(:loan, loan_type: Home_Loan)).to be_valid
    end
    it 'has valid loan_type' do
      expect(FactoryBot.build(:loan, loan_type: Personal_loan)).to be_valid
    end
    it 'has valid loan_type' do
      expect(FactoryBot.build(:loan, loan_type: Business_loan)).to be_valid
    end
    it 'has valid loan_type' do
      expect(FactoryBot.build(:loan, loan_type: Car_Loan)).to be_valid
    end

    it 'has not valid loan type' do
      expect(FactoryBot.build(:loan, loan_type: nil)).should_not be_valid
    end
end
