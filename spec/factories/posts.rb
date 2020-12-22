FactoryBot.define do
  factory :post do
    title               { Faker::Lorem.characters(number: 20)}
    tag_list            { Faker::Lorem.characters(number: 5)}
    sports              { Faker::Lorem.characters(number: 5)}
    datetime            { Faker::Time.between_dates(from: Date.today - 1, to: Date.today, period: :all)}
    regular_date        { Faker::Lorem.characters(number: 10)}
    region              { Faker::Address.full_address}
    cost                { Faker::Lorem.characters(number: 5)}
    content             { Faker::Lorem.characters(number: 40)}
    flow                { Faker::Lorem.characters(number: 40)}
    association :user
  end
end
