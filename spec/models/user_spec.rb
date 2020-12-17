require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context "新規登録がうまく行く時" do
      it "全ての値が存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it 'パスワードが6文字以上で登録できる' do
        @user.password = 'haruya0331'
        @user.password_confirmation = "haruya0331"
        expect(@user).to be_valid
      end
      it 'パスワードは、半角英数字混合で入力されている' do
        @user.password = 'haruya0331'
        @user.password_confirmation = "haruya0331"
        expect(@user).to be_valid
      end
    end
    context "新規登録がうまくいかない時" do
      it "passwordは6字以下だと登録できない" do
        @user.password = '00000'
        @user.password_confirmation = "00000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "パスワード(文字)だけじゃ不可  " do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        @user.valid?
        # binding.pry
        expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
      end

      it "passwordとpassword_confirmationが一致していないと登録できない" do
        @user.password = '0000aa'
        @user.password_confirmation = "00000ab"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "nick_nameが空だと登録できない" do
        @user.nick_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nick name can't be blank")
      end
      it "emailが空だと登録できない" do
         @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "passwordが空だと登録できない" do
         @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "birthdayが空だと登録できない" do
         @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      it "first_nameが空だと登録できない" do
         @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "first_name_kanaが空だと登録できない" do
         @user.first_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it "last_nameが空だと登録できない" do
         @user.last_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it "last_name_kanaが空だと登録できない" do
         @user.last_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it "重複したメールアドレスの場合、無効である" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
         expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
    end
  end
end
