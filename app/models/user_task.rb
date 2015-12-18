class UserTask < ActiveRecord::Base
  scope :tasks_completed_by_trainee_today, -> {
    where "created_at > :within_today", within_today: Time.now - 1.day}
  after_create :load_user
  after_create :update_status

  belongs_to :user
  belongs_to :task

  include PublicActivity::Model
  tracked except: [:destroy, :update], owner: ->(controller, model) {controller && controller.current_user}

  belongs_to :user_subject

  private
  def load_user
    self.user = self.user_subject.user
    self.save!
  end

  def update_status
    user = self.user
    if self.user_subject.user_tasks.
      count == self.task.course_subject_tasks.first.
        course_subject.tasks.count
      self.user_subject.finished!
    end
  end
end