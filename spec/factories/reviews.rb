FactoryBot.define do
  factory :review do
    content           { Faker::Lorem.characters(number: 30) }
    score             { Faker::Number.between(from:1, to:5) }
    association :reviewer, factory: :user
    association :reviewee, factory: :user
  end
end
