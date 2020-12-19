FactoryBot.define do
  factory :user do
    nickname {Faker::Name.name}
    email {Faker::Internet.free_email}
    profile { "30歳のサラリーマンです" }
    password { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
  end
end
