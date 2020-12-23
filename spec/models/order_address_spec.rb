require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
before do
  user = FactoryBot.create(:user)
  item = FactoryBot.create(:item)
  @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
end
  context "商品購入ができる時" do
    it "全てあれば登録できる" do
      expect(@order_address).to be_valid
    end
    it "電話番号が11けた以下なら登録できる" do
      @order_address.phone = "11111111111"
      expect(@order_address).to be_valid
    end
    it "建物番号がなくても登録できる" do
      @order_address.bill = nil
      expect(@order_address).to be_valid
    end
  end
  context "商品購入ができない時" do
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
    it "user_idが空だと登録できない" do
      @order_address.user_id = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("User can't be blank")
    end
    it "item_idが空だと登録できない" do
      @order_address.item_id = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Item can't be blank")
    end
    it "prefectureが--だと登録できない" do
      @order_address.prefecture_id = 1
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Prefecture must be other than 1")
    end
    it "postal_codeに-がないと登録できない" do
      @order_address.postal_code = "0000000"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code is invalid")
    end
    it "電話番号が全角数字だと登録できない" do
      @order_address.phone = "１１１１１１"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone is invalid")
    end
    it "電話番号が英数混合だと登録できない" do
      @order_address.phone = "111aaaaa11"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone is invalid")
    end
    it "11桁以内でないと登録できないこと" do
      @order_address.phone = "111111111111"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone is too long (maximum is 11 characters)")
    end
  end
end
