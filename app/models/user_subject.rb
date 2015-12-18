class UserSubject < ActiveRecord::Base
  belongs_to :user
  belongs_to :course_subject

  has_one :subject, through: :course_subject
  has_many :user_tasks
  accepts_nested_attributes_for :user_tasks, reject_if:
    proc { |attributes| attributes[:task_id]=='0' }, allow_destroy: true
  has_many :tasks, through: :user_tasks

  enum status: [ :_new, :finished ]
  scope :course_subject, ->(course_subject) {
    find_by( "course_subject_id = ?", course_subject.id ) }
end