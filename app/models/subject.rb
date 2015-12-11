class Subject < ActiveRecord::Base
  has_many :course_subjects, dependent: :destroy
  has_many :courses, through: :course_subjects, autosave: true
  has_many :users, through: :courses

  has_many :tasks

  accepts_nested_attributes_for :tasks
end
