class BirthdayMailer < ApplicationMailer
  default from: "no-reply@localhost.com"

  #TODO only instance variable can be passed to email
  def birthday_email(user)
    @user = user
    mail(to: @user.email, subject: "Happy Birth day #{@user.username}")
  end
end
