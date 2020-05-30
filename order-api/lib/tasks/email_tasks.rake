# frozen_string_literal: true
# file: lib/tasks/email_tasks.rake
# spec for rake task
desc 'send Birthday email'
task send_birthday_email: :environment do
  ActiveRecord::Base.establish_connection(:development)
  User.birthday_today.all.each do |user|
      BirthdayMailer.birthday_email(user).deliver!
    end
end