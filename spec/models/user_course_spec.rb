require "rails_helper"

describe UserCourse do
  it {should belong_to :user}
  it {should belong_to :course}

  describe UserCourse, 'column_specification' do
    it {should have_db_column(:user_id).of_type(:integer).with_options presence: true}
    it {should have_db_column(:course_id).of_type(:integer).with_options presence: true}
    it {should have_db_column(:deadline).of_type(:datetime).with_options presence: true}
    it {should have_db_column(:is_completed).of_type(:boolean).with_options presence: true}
  end

  describe ".find the user course" do
    let(:user) {create :user}
    let(:course) {create :course}
    let(:user_course) {create :user_course}

    context "has the user_course" do
      subject {UserCourse.has_user user_course.user}
      it {is_expected.to be_an UserCourse}
    end
  end
end

