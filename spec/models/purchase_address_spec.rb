require 'rails_helper'
describe PurchaseAddress do
  before do
    @purchase_address = FactoryBot.build(:purchase_address)
  end

  describe '配送先入力' do
    context '配送先入力がうまくいくとき' do
      it "post_codeとprefecture_idとcityとhouse_numberとphone_numberが存在すれば入力できる" do
        expect(@purchase_address).to be_valid
      end
      it "building_nameが空でも入力できる" do
        @purchase_address.building_name = ""
      end
      it "priceとtokenがあれば保存ができること" do
        expect(@purchase_address).to be_valid
      end
    end

    context '配送先入力がうまくいかないとき' do
      it "post_codeが空では入力できない" do
        @purchase_address.post_code = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Post code can't be blank")
      end
      it "post_codeがハイフンがないと入力できない" do
        @purchase_address.post_code = "2110068"
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Post code Input correctly")
      end
      it "prefecture_idにid:1がある入力できない" do
        @purchase_address.prefecture_id = 0
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Prefecture Select")
      end
      it "cityが空では入力できない" do
        @purchase_address.city = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("City can't be blank")
      end
      it "house_numberが空では入力できない" do
        @purchase_address.house_number = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("House number can't be blank")
      end
      it "phone_numberが空では入力できない" do
        @purchase_address.phone_number = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it "phone_numberがハイフンがあると入力できない" do
        @purchase_address.phone_number = "090-1234-5678"
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number Input only number")
      end
      it "phone_numberが12桁以上であると入力できない" do
        @purchase_address.phone_number = "0901234567890"
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number Input only number")
      end
      it "tokenが空では登録できないこと" do
        @purchase_address.token = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end