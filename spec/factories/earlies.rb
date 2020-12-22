FactoryBot.define do
  factory :early do
    text {Faker::Lorem.sentence}
    association :user

    after(:build) do |early|
      early.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
