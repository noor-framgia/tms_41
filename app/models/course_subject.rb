class CourseSubject < ActiveRecord::Base
  belongs_to :course
  belongs_to :subject
  belongs_to :user
  has_many :course_subject_tasks
  has_many :course_subject_tasks
  has_many :tasks, through: :course_subject_tasks

  validates :course_id, uniqueness: {scope: :subject_id}

  enum status: [ :_new, :finished ]

  accepts_nested_attributes_for :course_subject_tasks  , allow_destroy: true
end

