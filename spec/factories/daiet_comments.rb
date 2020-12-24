FactoryBot.define do
  factory :daiet_comment do
    content {Faker::Lorem.sentence}
    association :user
    association :daiet
  end
end
