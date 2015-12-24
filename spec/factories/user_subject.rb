require "faker"

FactoryGirl.define do
  factory :user_subject do |f|
    user
    course_subject
    status 0
  end
end