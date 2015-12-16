class UserCourse < ActiveRecord::Base
  belongs_to :user
  belongs_to :course

  before_create :populate_user_subject
  before_update :update_user_subject
  before_destroy :destroy_user_subject

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
end