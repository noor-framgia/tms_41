require "faker"

FactoryGirl.define do
  factory :user do
    name {Faker::Name}
    role 0
    email {Faker::Internet.email}
    password {Faker::Internet.password 6}
  end
end