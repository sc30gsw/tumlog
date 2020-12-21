FactoryBot.define do
  factory :daiet do
    text {Faker::Lorem.sentence}
    association :user

    after(:build) do |daiet|
      daiet.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end