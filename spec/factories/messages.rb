FactoryBot.define do
  factory :message do
    text          { Faker::Lorem.characters(number: 20) }
    association :user
    association :room
  end
end
