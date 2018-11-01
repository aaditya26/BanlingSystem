FactoryBot.define do
  factory :user do
    name {FactoryBot.create(:name).name}
    AccountNumber {FactoryBot.create(:AccountNumber).AccountNumber}
    number {FactoryBot.create(:number).number}
    address {FactoryBot.create(:address).address}
    email {FactoryBot.create(:email).email}
    password {FactoryBot.create(:password).password}

  end
end
