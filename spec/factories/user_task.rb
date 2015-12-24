require "faker"

FactoryGirl.define do
  factory :user_task do
    user
    task
    user_subject
  end
end