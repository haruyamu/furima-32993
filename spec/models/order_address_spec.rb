require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @order_address = FactoryBot.build(:order_address)
  end
  it "全てあれば登録できる" do
    expect(@order_address).to be_valid
  end
  it "電話番号が11けた以下なら登録できる" do
    @order_address.phone = "11111111111"
    @order_address.valid?
    expect(@order_address).to be_valid
  end

  it "postal_codeが空だと登録できない" do
    @order_address.postal_code = nil
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
  end
  it "cityが空だと登録できない" do
    @order_address.city = nil
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("City can't be blank")
  end
  it "addressが空だと登録できない" do
    @order_address.address = nil
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("Address can't be blank")
  end
  it "phoneが空だと登録できない" do
    @order_address.phone = nil
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("Phone can't be blank")
  end
  it "tokenが空だと登録できない" do
    @order_address.token = nil
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("Token can't be blank")
  end
  it "prefectureが--だと登録できない" do
    @order_address.prefecture_id = 1
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("Prefecture must be other than 1")
  end
  it "postal_codeに-がないと登録できない" do
    @order_address.postal_code = 0000000
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("Postal code is invalid")
  end
  
end
