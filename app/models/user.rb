class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
 
         with_options presence: true do
           validates :nickname
           validates :birthday
           validates :last_name, format: {with: /\A[ぁ-んァ-ン一-龥]/, message: '全角文字を使用してください' }
           validates :first_name, format: {with: /\A[ぁ-んァ-ン一-龥]/, message: '全角文字を使用してください' }
           validates :last_name_kana, format: {with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: '全角(カタカナ)を使用してください' }
           validates :first_name_kana, format: {with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: '全角(カタカナ)を使用してください' }
          
         end
end
