FactoryBot.define do
  factory :user_purchase_record do
    postal_code { '000-0000' }
    prefecture { 1 }
    municipality { '都道府県' }
    address { '市区町村' }
    building_name { '建物名' }
    phone_number { '00000000000' }
    purchase_record { 1 }
    token { 'tok_abcdefghijk00000000000000000' }
    price { 3000 }
  end
end
