FactoryBot.define do
  factory :saving_comment do
    content {Faker::Lorem.sentence}
    association :user
    association :saving
  end
end
