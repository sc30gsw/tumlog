FactoryBot.define do
  factory :early_comment do
    content {Faker::Lorem.sentence}
    association :user
    association :early
  end
end
