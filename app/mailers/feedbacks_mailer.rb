class FeedbacksMailer < ApplicationMailer
  def feedback(feedback, user)
    @feedback = feedback
    @user = user&.email || t('.stranger')
    admin_email = ENV['ADMIN_EMAIL']
    mail to: admin_email, subject: t('.subject')
  end
end