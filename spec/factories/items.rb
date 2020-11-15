FactoryBot.define do
  factory :item do
    item_name                   {"商品名"}
    explain                     {Faker::Lorem.sentence}
    price                       {9999}
    category_id                 {3}
    item_condition_id           {3}
    delivery_feed_id            {3}
    shipping_origin_id          {13}
    day_until_shipping_id       {2}
    association :user 

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
