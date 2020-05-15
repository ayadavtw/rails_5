# file: lib/tasks/email_tasks.rake

desc 'send Birthday email'
task send_birthday_email: :environment do
  ActiveRecord::Base.establish_connection(
      adapter:  "postgresql",
      host:     "localhost",
      username: "orders_user",
      password: "orders_password",
      database: "order_api"
  )
  User.all.each do |user|
    day,month = Time.now.day , Time.now.month
    BirthdayMailer.birthday_email(user).deliver! if(user.dob.to_time.month==month && user.dob.to_time.day==day)
  end
  # ... set options if any

end