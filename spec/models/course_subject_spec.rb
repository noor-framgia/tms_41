require "rails_helper"

describe CourseSubject do
  it {should belong_to :course}
  it {should belong_to :subject}
  it {should have_many :course_subject_task}
end