FactoryBot.define do
  factory :user do
    name                    { Faker::Name.last_name}
    profile                 { Faker::Lorem.characters(number: 30) }
    email                   { Faker::Internet.free_email}
    password                { 'tefdn35mgr'}
    password_confirmation   { password}
  end
end
