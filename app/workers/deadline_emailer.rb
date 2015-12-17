class DeadlineEmailer
  include Sidekiq::Worker

  def perform
    courses = Course.courses_to_be_sent_deadline
    courses.each do |course|
      course.users.each do |user|
        TMSMailer.email_about_deadline(user, course).deliver
      end
    end
  end
end