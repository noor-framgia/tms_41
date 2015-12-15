class CourseSubject < ActiveRecord::Base
  belongs_to :course
  belongs_to :subject

  validates :course_id, uniqueness: {scope: :subject_id}

  has_many :course_subject_tasks
  has_many :tasks, through: :course_subject_tasks

  belongs_to :user

  enum status: [ :_new, :finished ]
end