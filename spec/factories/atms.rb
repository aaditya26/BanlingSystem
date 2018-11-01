FactoryBot.define do
  factory :atm do
    transaction_number {FactoryBot.create(:transaction_number).transaction_number}
    bank {FactoryBot.create(:bank).bank}
    address {FactoryBot.create(:address).address}
  end
end
