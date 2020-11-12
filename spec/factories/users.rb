FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {"000000"}
    password_confirmation {password}
    first_name            {Faker::Name.first_name}
    last_name             {Faker::Name.last_name}
    first_name_kana       {Faker::Name.first_name}
    last_name_kana        {Faker::Name.last_name}
    birthday              {Faker::Date.birthday}
  end
end