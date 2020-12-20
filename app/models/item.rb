class Item < ApplicationRecord

  has_one_attached :image
   extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category,:state,:prefecture,:schedule_delivery,:shipping_fee
  belongs_to :user
  with_options presence: true do
    validates :image
    validates :name
    validates :explain
    validates :category_id, numericality: {other_than: 1}
    validates :state_id, numericality: {other_than: 1}
    validates :shipping_fee_id, numericality: {other_than: 1}
    validates :schedule_delivery_id, numericality: {other_than: 1}
    validates :prefecture_id, numericality: {other_than: 1}
    validates :price, numericality: /\A[0-9]+\z/
  end
end
