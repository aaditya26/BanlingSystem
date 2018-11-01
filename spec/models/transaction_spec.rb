require 'rails_helper'

RSpec.describe Transaction, type: :model do
  describe '#deposit' do
    context 'with valid params' do
     it 'deposit into account' do
       deposited = described_class.deposit(account, 9.99)
       expect(deposited).to eq true
     end
    end

   context 'when amount <= 0.00' do
     it 'returns false' do
       deposited = described_class.deposit(account, 0.00)
       expect(deposited).to eq false
    end
   end
 end
 describe '#withdraw' do
    context 'with valid params' do
     it 'withdraw from account' do
       withdrawn = described_class.withdraw(account, 9.99)
       expect(withdrawn).to eq true
     end
    end

   context 'when amount <= 0' do
     it 'returns false' do
       withdrawn = described_class.withdraw(account, 0.00)
       expect(withdrawn).to eq false
     end
   end
 end

 describe '#transfer' do
   let!(:user_recipient) { create(:user, number: '0123456789') }
   let(:params_recipient) { attributes_for(:account, name: user_recipient.name) }
   let!(:recipient) { create(:account, params_recipient) }

   context 'with valid params' do
     it 'transfer from one account to another account' do
       transfered = described_class.transfer(account, recipient, 9.99)
       expect(transfered).to eq true
     end
   end

   context 'when amount <= 0' do
     it 'returns false' do
       transfered = described_class.transfer(account, recipient, 0.00)
       expect(transfered).to eq false
     end
   end
 end
end
