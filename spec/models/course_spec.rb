require "rails_helper"

describe Course do
  it "is valid with name, start_date, end_date, status" do
    cse = build(:course)
    expect(cse).to be_valid
  end
  it "is invalid without name" do
    cse = build(:course, name: nil)
    cse.valid?
    expect(cse.errors[:name]).not_to include "Name can't be blank"
  end
  it "is invalid without start_date" do
    cse = build(:course, start_date: nil)
    cse.valid?
    expect(cse.errors[:start_date]).not_to include "Start date can't be blank"
  end
  it "is invalid without end_date" do
    cse = build(:course, end_date: nil)
    cse.valid?
    expect(cse.errors[:end_date]).not_to include "End date can't be blank"
  end
  it "is invalid without status" do
    cse = build(:course, status: nil)
    cse.valid?
    expect(cse.errors[:status]).not_to include "Status can't be blank"
  end
  it "start_date must be prior to end_date" do
    cse = build(:course,
      start_date: Faker::Time.between(1.years.ago, 1.week.ago),
      end_date: Faker::Time.between(2.years.ago, 1.year.ago))
    cse.valid?
    expect(cse.errors[:start_date]).not_to include " be before the end date"
  end
  it "named scope: courses to be sent deadline" do
    courses = create_list(:course, 5)
    expect(courses.count).to eq 5
  end
  it "is testing default enum of course model" do
    expect(build(:course).open?).to eq true
  end
  it {should have_many(:user_courses).dependent(:destroy)}
  it {should have_many(:users)}
  it {should have_many(:course_subjects).dependent(:destroy)}
  it {should have_many(:subjects)}
end
