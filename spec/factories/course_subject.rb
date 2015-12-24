require "faker"

FactoryGirl.define do
  factory :course_subject do |f|
    course
    subject
  end
end
