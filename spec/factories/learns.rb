FactoryBot.define do
  factory :learn do
    text {Faker::Lorem.sentence}
    association :user

    after(:build) do |learn|
      learn.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end