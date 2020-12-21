FactoryBot.define do
  factory :exercise do
    text {Faker::Lorem.sentence}
    association :user

    after(:build) do |exercise|
      exercise.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end