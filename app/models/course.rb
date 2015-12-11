class Course < ActiveRecord::Base
  has_many :user_courses
  has_many :users, through: :user_courses

  has_many :course_subjects, dependent: :destroy
  has_many :subjects, through: :course_subjects, autosave: true

  has_many :tasks, through: :subjects

end
