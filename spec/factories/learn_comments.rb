FactoryBot.define do
  factory :learn_comment do
    content {Faker::Lorem.sentence}
    association :user
    association :learn
  end
end
