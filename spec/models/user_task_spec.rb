require "rails_helper"

describe UserTask do
  subject {FactoryGirl.create :user_task}
  it {is_expected.to be_an UserTask}
  it {expect belong_to :user}
  it {expect belong_to :task}
 # it {expect belong_to :user_subject}

  describe ".finding_task_id" do
    let!(:user) {FactoryGirl.create :user}
    let!(:task) {FactoryGirl.create :task}
   # let!(:task) {FactoryGirl.create :user_subject}
    let!(:user_task1) {FactoryGirl.create :user_task}

    context "user_task obj using user_task1" do
      subject {UserTask.finding_task_id user_task1.user_id, user_task1.task_id }  #user_task1.user_subject.id
      it {is_expected.to be_an UserTask}
    end

    context "no user_task obj using user and task" do
      subject {UserTask.finding_task_id user, task } # user_subject
      it {is_expected.not_to be_an UserTask}
    end
  end
end