require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nicknameとemailとpasswordとpassword_confirmationとlast_nameとfirst_nameとlast_name_kanaとfirst_name_kanaとbirthdayが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "passwordが6文字以上であれば登録できる" do
        @user.password = "aaa000"
        @user.password_confirmation = "aaa000"
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空だと登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "emailに＠が存在する場合登録できない" do
        @user.email= ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "passwordが空だと登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが5文字以下であれば登録できない" do
        @user.password = "aa000"
        @user.password_confirmation = "aa000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "passwordが英字のみの場合に登録ができない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end
      it "passwoedが数字のみの場合に登録ができない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end  
      it "last_nameとが空だと登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last_name can't be blank")
      end
      it "first_nameとが空だと登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First_name can't be blank")
      end
      it "last_nameが全角でないと登録できない" do
        @user.text = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last_name 全角文字を使用してください")
      end
      it "first_nameが全角でないと登録できない" do
        @user.text = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First_name 全角文字を使用してください")
      end
      it "last_name_kanaが空だと登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last_name_kana can't be blank")
      end
      it "first_name_kanaが空だと登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First_name_kana can't be blank")
      end
      it "last_name_kanaが全角(カタカナ)でないと登録できない" do
        @user.text = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last_name_kana 全角(カタカナ)を使用してください")
      end
      it "first_name_kanaが全角(カタカナ)でないと登録できない" do
        @user.text = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First_name_kana 全角(カタカナ)を使用してください")
      end
      it "birthdayが空だと登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end