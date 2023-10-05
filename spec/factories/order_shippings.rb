FactoryBot.define do
  factory :order_shipping do
    postal_code { Faker::Lorem.characters(number: 3, min_numeric: 3) + '-' + Faker::Lorem.characters(number: 4, min_numeric: 4) }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    municipalities { '東京都' }
    house_number { '1-1' }
    building_name { '東京ハイツ' }
    phone_number { Faker::Lorem.characters(number: 10, min_numeric: 10) }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
