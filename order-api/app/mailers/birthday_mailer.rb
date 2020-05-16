class BirthdayMailer < ApplicationMailer
  def birthday_email(user)
    @user = user
    mail(to: @user.email, subject: "Happy Birth day #{@user.username}")
  end
end
