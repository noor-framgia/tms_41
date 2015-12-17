class UserTask < ActiveRecord::Base
  scope :tasks_completed_by_trainee_today, -> {where "created_at > :within_today",
    within_today: Time.now - 1.day}

  belongs_to :user
  belongs_to :task
end
