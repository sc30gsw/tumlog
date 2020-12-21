FactoryBot.define do
  factory :mind do
    text {Faker::Lorem.sentence}
    association :user

    after(:build) do |mind|
      mind.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end