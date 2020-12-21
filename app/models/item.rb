class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
   extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :prefecture
  belongs_to :schedule_delivery
  belongs_to :shipping_fee
  belongs_to :user
  with_options presence: true do
    validates :image
    validates :name
    validates :explain
    with_options numericality: {other_than: 1} do
      validates :category_id
      validates :state_id
      validates :shipping_fee_id
      validates :schedule_delivery_id
      validates :prefecture_id
    end
    validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  end
end
