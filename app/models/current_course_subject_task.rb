class CurrentCourseSubjectTask < ActiveRecord::Base
  belongs_to :course
  belongs_to :subject
  belongs_to :task
end
