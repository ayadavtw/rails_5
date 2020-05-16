# frozen_string_literal: true
# file: lib/tasks/email_tasks.rake

desc 'send Birthday email'
task send_birthday_email: :environment do
  ActiveRecord::Base.establish_connection(:development)
  User.all.each do |user|
    day = Time.now.day
    month = Time.now.month
    if user.dob.to_time.month == month && user.dob.to_time.day == day
      BirthdayMailer.birthday_email(user).deliver!
    end
  end
end
