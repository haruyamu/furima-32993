class OrderAddress

  include ActiveModel::Model
  attr_accessor :postal_code,:prefecture_id,:city,:address,:bill,:phone,:user_id,:item_id,:token

   with_options presence: true do
  validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
  validates :city
  validates :user_id
  validates :item_id
  validates :token
  validates :address
  validates :phone, length: { maximum: 11 },format: {with: /\A[0-9]+\z/}
  validates :prefecture_id, numericality: { other_than: 1}
  end
    def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code,city: city,address: address,prefecture_id: prefecture_id,phone: phone,bill: bill,order_id: order.id)
  end
end