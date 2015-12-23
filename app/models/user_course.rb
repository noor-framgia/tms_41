class UserCourse < ActiveRecord::Base
  belongs_to :user
  belongs_to :course
  before_create :populate_user_subject
  before_update :update_user_subject
  before_destroy :destroy_user_subject
  # belongs_to :trainees, -> {trainees}, class_name: "User", foreign_key: "user_id"
  # belongs_to :supervisors, -> {supervisors}, class_name: "User", foreign_key: "user_id"

  private
  def populate_user_subject
    self.course.course_subjects.each do |course_subject|
      UserSubject.create course_subject_id: course_subject.id,
        user_id: self.user_id
    end
  end

  def update_user_subject
    destroy_user_subject
    populate_user_subject
  end

  def destroy_user_subject
    UserSubject.user(self.user_id).each do |user_subject|
      user_subject.destroy
    end
  end

  include PublicActivity::Model
  tracked except: [:destroy, :create], owner: ->(controller, model) {controller && controller.current_user}
  tracked owner: ->(controller, model) {controller && controller.current_user}
   # validates :course_id, uniqueness: {scope: :user_id}, presence: true
  scope :has_user, -> user {find_by user_id: user.id}
end
