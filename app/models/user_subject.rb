class UserSubject < ActiveRecord::Base
  belongs_to :user
  belongs_to :course_subject

  enum status: [ :_new, :finished ]
  scope :course_subject, ->(course_subject) {
    find_by( "course_subject_id = ?", course_subject.id ) }
end