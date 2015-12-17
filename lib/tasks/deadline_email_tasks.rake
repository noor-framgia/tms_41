desc "send digest email"
task send_digest_email: :environment do
  courses = Course.courses_to_be_sent_deadline
  courses.each do |course|
    course.users.each do |user|
      TmsMailer.email_about_deadline(user, course).deliver_now
    end
  end
end