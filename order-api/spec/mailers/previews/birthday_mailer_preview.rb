# Preview all emails at http://localhost:3000/rails/mailers/signup_mailer
class BirthdayMailerPreview < ActionMailer::Preview
  def birthday_mail_preview
    BirthdayMailer.birthday_email(User.first)
  end
end
