# frozen_string_literal: true
# file: lib/tasks/email_tasks.rake
# spec for rake task
desc 'send Birthday email'
task send_birthday_email: :environment do
  # we don't need establish conncetion here , need to check how to passs environmnet
  ActiveRecord::Base.establish_connection(:development)
  day = Time.now.day
  month = Time.now.month
  User.all.each do |user|
    # optimization - rails-scope - class method? || sql optimization
    # feature envy function can be defined on user
    if user.dob.to_time.month == month && user.dob.to_time.day == day
      BirthdayMailer.birthday_email(user).deliver!
    end
  end
end
#