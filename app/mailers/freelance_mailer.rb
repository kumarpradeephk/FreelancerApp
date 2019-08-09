class FreelanceMailer < ApplicationMailer
  default from: "xyz@example.com"
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.freelance_mailer.project_approval.subject
  #
  def project_approval(user)
    @user = user
    mail to: @user.email, subject: "Approval of requested project at Freelancer.com"
  end

    def rejection_mail(user)
    @user = user
    mail to: @user.email, subject: "Decline of requested project at Freelancer.com"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.freelance_mailer.signup_confirmation.subject
  #
  def signup_confirmation(user)
    @user = user
    mail to: user.email, subject: "Signup confirmation from FreeLance"
  end
end

