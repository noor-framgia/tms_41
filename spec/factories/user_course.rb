require "faker"

FactoryGirl.define do
  factory :user_course do |f|
    user
    course
  end
end
