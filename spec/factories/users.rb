FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {"aaa000"}
    password_confirmation {password}
    first_name            {"和剛"}
    last_name             {"山口"}
    first_name_kana       {"カズタカ"}
    last_name_kana        {"ヤマグチ"}
    birthday              {Faker::Date.birthday}
  end
end