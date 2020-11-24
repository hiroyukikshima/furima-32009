FactoryBot.define do
  factory :item do
    title              {"商品名"}
    explanation        {"説明文"}
    price              {"9999999"}
    category_id        {"2"}
    status_id          {"2"}
    shipping_charge_id {"2"}
    shipment_source_id {"2"}
    days_id            {"2"}
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test.jpg'), filename: 'test.jpg')
    end 
  end
end
