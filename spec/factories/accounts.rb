FactoryBot.define do
  factory :account do
    AccountNumber {FactoryBot.create(:account).bank_name}
    number {FactoryBot.create(:number).number}
    balance {FactoryBot.create(:balance).balance}
  end
end
