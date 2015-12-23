require "faker"

FactoryGirl.define do
  factory :course do
    name {Faker::Lorem.word}
    description {Faker::Lorem.paragraph}
    start_date {Faker::Date.backward}
    end_date {Faker::Date.forward}
    status 1
  end
end