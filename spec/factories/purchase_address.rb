FactoryBot.define do
  factory :purchase_address do
    post_code                   {"211-0068"}
    prefecture_id               {3}
    city                        {"川崎市中原区"}
    house_number                {"番地"}
    building_name               {"建物名"}
    phone_number                {"09012345678"}
    token {"tok_abcdefghijk00000000000000000"}
 end
end

