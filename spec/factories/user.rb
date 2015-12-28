require "faker"

FactoryGirl.define do
  factory :user do
    name {Faker::Name}
    email {Faker::Internet.email}
    password {Faker::Internet.password 6}
    role 1
    factory :supervisor do
    role 0
    end
  end

end