FactoryBot.define do
  factory :mind_comment do
    content {Faker::Lorem.sentence}
    association :user
    association :mind
  end
end
