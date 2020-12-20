require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe "商品出費機能" do
    it 'うまく出品できる時' do
      expect(@item).to be_valid
    end
    it '商品名がないと出品できない' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it '商品の説明がないと出品できない' do
      @item.explain = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Explain can't be blank")
    end
    it 'カテゴリーの情報がないと出品できない' do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end
    it '商品の状態の情報がないと出品できない' do
      @item.state_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("State can't be blank")
    end
    it '発送料の負担の情報がないと出品できない' do
      @item.shipping_fee_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping fee can't be blank")
    end
    it '発送元の地域の情報がないと出品できない' do
      @item.prefecture_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture can't be blank")
    end
    it '発送までの日数の情報がないと出品できない' do
      @item.schedule_delivery_id= nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Schedule delivery can't be blank")
    end
    it '価格の情報がないと出品できない' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it '商品画像が一枚ないと出品できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it "価格は半角数字のみでないと保存できない" do
      @item.price = '３００'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end
  end
end
