FactoryBot.define do
  factory :mind do
    text {Faker::Lorem.sentence}
  end
end