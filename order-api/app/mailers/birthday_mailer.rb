class BirthdayMailer < ApplicationMailer
  def birthday_email(user)
    @user = user
    logger.debug("going to send a bithday email"+@user.username)
    mail(to: @user.email, subject: "Happy Birth day #{@user.username}")
  end
end
