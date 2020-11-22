class Item < ApplicationRecord
    has_one :purchase
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

  with_options numericality: { other_than: 1, message: "Select" } do
  validates :category_id 
  validates :item_condition_id
  validates :delivery_feed_id
  validates :shipping_origin_id
  validates :day_until_shipping_id
  end

  validates :content, presence: true, unless: :was_attached?

  def was_attached?
    self.image.attached?
  end
end

