FactoryBot.define do
  factory :exercise_comment do
    content {Faker::Lorem.sentence}
    association :user
    association :exercise
  end
end
