# Preview all emails at http://localhost:3000/rails/mailers/freelance_mailer
class FreelanceMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/freelance_mailer/project_approval
  def project_approval
    FreelanceMailerMailer.project_approval
  end

  # Preview this email at http://localhost:3000/rails/mailers/freelance_mailer/signup_confirmation
  def signup_confirmation
    FreelanceMailerMailer.signup_confirmation
  end

end
