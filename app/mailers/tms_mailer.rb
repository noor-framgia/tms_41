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

  def email_trainee_report supervisor_id, trainee_id, tasks
    @user = user
    @tasks = tasks
    tasks.each do |task|
      mail to: @user.email, subject: t(:email_trainee_report_subject)
    end
  end

  def email_about_deadline user, course
    @user = user
    @course = course
    mail to: "framgia.bangladesh@gmail.com", subject: t(:email_about_deadline_subject)
  end
end
