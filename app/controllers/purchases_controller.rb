class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :move_to_index, only: [:index]
  before_action :set_item, only: [:index, :create]
  


  def index
    @purchase_address = PurchaseAddress.new
  end  
  
  def create
    @purchase_address = PurchaseAddress.new(address_params)   
     if @purchase_address.valid?
       pay_item
       @purchase_address.save
       redirect_to root_path
     else
       render action: :index
     end
  end

  private

  def address_params
    params.permit(:post_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(user_id:current_user.id, item_id:params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: address_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
  end 
  
  def move_to_index
    @purchase = Item.find(params[:item_id])
    if @purchase.purchase != nil || current_user.id == @purchase.user_id
      redirect_to root_path
    end
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  
end
