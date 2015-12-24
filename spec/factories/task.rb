require "faker"

FactoryGirl.define do
  factory :task do
    name {Faker::Lorem.word}
    description {Faker::Lorem.paragraph}
    subject
  end
end