class Report < ActiveRecord::Base
  belongs_to :user

  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :todays_date, presence: true
  validates :todays_task, presence: true
  validates :tomorrows_task, presence: true
  validates :free_comment, presence: true
end
