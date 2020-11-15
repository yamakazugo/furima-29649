require 'rails_helper'
describe Item do
   before do
     @item = FactoryBot.build(:item)
   end

  describe '商品情報入力' do
     context '商品情報入力ができるとき' do
       it "item_nameとexplainとpriceとcategory_idとitem_condition_idとdelivery_feed_idとshipping_origin_idとday_until_shipping_idとimageが存在すれば入力できる" do
        expect(@item).to be_valid
       end
    
    

    context '商品情報入力ができないとき' do
      it "item_nameが空だとと入力できない" do
        @item.item_name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it "explainがないと入力できない" do
        @item.explain = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Explain can't be blank")
      end
      it "category_idがないと入力できない" do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category Select")
      end
      it "item_condition_idがないと入力できない" do
        @item.item_condition_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item condition Select")
      end
      it "delivery_feed_idがないと入力できない" do
        @item.delivery_feed_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery feed Select")
      end
      it "shipping_origin_idがないと入力できない" do
        @item.shipping_origin_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping origin Select")
      end
      it "day_until_shipping_idがないと入力できない" do
        @item.day_until_shipping_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Day until shipping Select")
      end
      it "priceがないと入力できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "priceが¥299以下だと入力できない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
      it "priceが¥10.000,000以上だと入力できない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
      it "priceは半角数字でないと入力できない" do
        @item.price = "９８７"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Half-size number")
      end
      it "imageがないと入力できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "ユーザーが紐付いていないとツイートは保存できない" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
    end
 end
end
