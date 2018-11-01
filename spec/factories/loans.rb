FactoryBot.define do
  factory :loan do
    type {FactoryBot.create(:type).type}
    amount {FactoryBot.create(:amount).amount}
  end
end
