FactoryGirl.define do
  factory :event do
    sequence(:title) { |n| "Event #{n}" }
    description { Faker::Lorem.paragraph }
    start_date { Faker::Date.backward(20) }
    end_date Faker::Date.forward(20)
    location { Faker::GameOfThrones.city }
    is_actual true
  end
end