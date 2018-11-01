FactoryBot.define do
  factory :transaction do
    AccountNumber {FactoryBot.create(:AccountNumber).AccountNumber}
    balance {FactoryBot.create(:balance).balance}
    TransactionType {FactoryBot.create(:TransactionType).TransactionType}
  end
end
