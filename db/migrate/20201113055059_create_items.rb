class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :item_name,               null: false
      t.text :explain,                   null: false
      t.integer :category_id,            null: false 
      t.integer :item_condition_id,      null: false 
      t.integer :delivery_feed_id,       null: false 
      t.integer :shipping_origin_id,     null: false
      t.integer :day_until_shipping_id,  null: false
      t.integer :price,                  null: false
      t.references :user,                null: false, foreign_key: true
      t.timestamps
    end
  end
end
