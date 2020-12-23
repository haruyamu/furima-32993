FactoryBot.define do
  factory :order_address do
    postal_code {"123-4567"}
    prefecture_id {2}
    user_id {2}
    item_id {2}
    city {"広島市安佐南区"}
    address {'祇園2丁目'}
    bill {"ビル"}
    phone {"00000000000"}
    token {"accVkjcJyb4BWCxGsndESCJQbdFMogUC5PbRDqceLTC"}
  end
end
