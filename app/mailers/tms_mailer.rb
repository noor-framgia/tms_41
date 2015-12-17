class TmsMailer < ApplicationMailer
  def email_trainee_added user, course
    @user = user
    @course = course
    mail to: @user.email, subject: t(:email_inclusion_to_course_subject)
  end

  def email_trainee_removed user, course
    @user = user
    @course = course
    mail to: @user.email, subject: t(:email_removal_from_course_subject)
  end

  def email_trainee_report user_id
    @user = User.find user_id
    @tasks = @users.tasks
    mail to: @user.email, subject: t(:email_trainee_report_subject)
  end

  def email_about_deadline user, course
    @user = user
    @course = course
    mail to: user.email, subject: t(:email_about_deadline_subject)
  end
end
