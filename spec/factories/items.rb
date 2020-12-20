FactoryBot.define do
  factory :item do
     after(:build) do |item|
     item.image.attach(io: File.open('public/images/logo.png'), filename: 'logo.png')
      end
    name {"item"}
    explain {"これは商品です"}
    category_id {2}
    state_id {2}
    shipping_fee_id {2}
    prefecture_id {2}
    schedule_delivery_id {2}
    price {300}
    association :user
  end
end
