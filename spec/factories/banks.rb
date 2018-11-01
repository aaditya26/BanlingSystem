FactoryBot.define do
  factory :bank do
    name {FactoryBot.create(:name).name}
    address {FactoryBot.create(:address).address}
    number {FactoryBot.create(:number).number}
    code {FactoryBot.create(:code).code}
  end
end
