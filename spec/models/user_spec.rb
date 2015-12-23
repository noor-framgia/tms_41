require "rails_helper"

describe User do
  it "has a valid factory" do
    expect(create :user).to be_valid
  end

  it {should validate_presence_of :name}
  it {should validate_length_of(:name).is_at_most 50}
  it {should validate_presence_of :email}
  it {should validate_presence_of :password}
  it {should validate_length_of(:password).is_at_least 5}
  it {should have_many :user_courses}
  it {should have_many(:courses).through :user_courses}
  it {should have_many(:subjects).through :courses}
  it {should have_many :user_tasks}
  it {should have_many(:tasks).through :user_tasks}
  it {should have_many :user_subjects}
  it {should have_many(:course_subjects).through :user_subjects}
end

describe User, 'column_specification' do
  it {should have_db_column(:name).of_type(:string).with_options length: {maximum: 100}, presence: true}
  it {should have_db_column(:email).of_type(:string).with_options presence: true}
  it {should have_db_column(:encrypted_password).of_type(:string).with_options length: {minimum: 5}, presence: true}
end