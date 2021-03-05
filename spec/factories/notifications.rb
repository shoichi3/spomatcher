FactoryBot.define do
  factory :notification do
    checked       { true }
    action        { 'message' }
    association :visitor, factory: :user
    association :visited, factory: :user
    association :post
    association :room
  end
end
