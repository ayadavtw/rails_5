class SignupMailer < ApplicationMailer
  default from: "no-reply@localhost.com"

  #TODO only instance variable can be passed to email
  def signup_email(user)
    @user = user
    num = 1
    mail(to: @user.email, subject: 'Signup Email')
  end
end
