class SignupMailer < ApplicationMailer
  def signup_email(user)
    @user = user
    mail(to: @user.email, subject: 'Signup Email')
  end
end
