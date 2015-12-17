class ReportEmailer
  include Sidekiq::Worker

  def perform
    User.all.each do |user|
      TMSMailer.email_trainee_report(user.id).deliver
    end
  end
end