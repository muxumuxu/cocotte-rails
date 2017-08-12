FactoryGirl.define do
  factory :food do
    name { Faker::Name.name }
    food_category
  end
end
