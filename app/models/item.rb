class Item < ApplicationRecord
  
    belongs_to :user
    has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :item_condition
  belongs_to_active_hash :delivery_feed
  belongs_to_active_hash :shipping_origin
  belongs_to_active_hash :day_until_shipping


  with_options presence: true do
  validates :image
  validates :item_name
  validates :explain
  validates :price, numericality: {only_integer: true, message: 'Half-size number' }
  end
  validates :price, inclusion: {in: (300..9999999)}
  validates :category_id, numericality: { other_than: 1, message: "Select" } 
  validates :item_condition_id, numericality: { other_than: 1, message: "Select" } 
  validates :delivery_feed_id, numericality: { other_than: 1, message: "Select" } 
  validates :shipping_origin_id, numericality: { other_than: 1, message: "Select" } 
  validates :day_until_shipping_id, numericality: { other_than: 1, message: "Select" } 
  
end

