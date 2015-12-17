class ReportEmailer
  include Sidekiq::Worker

  def perform
    User.all.each do |user|
      TmsMailer.email_trainee_report(user.id).deliver_now
    end
  end
end