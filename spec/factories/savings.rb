FactoryBot.define do
  factory :saving do
    text {Faker::Lorem.sentence}
    association :user

    after(:build) do |saving|
      saving.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end