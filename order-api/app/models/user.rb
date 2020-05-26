class User < ApplicationRecord
  validates_uniqueness_of :username
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtBlacklist
  after_create :send_admin_mail

  # scope to get data , scope is class method
  scope :birthday_today, -> {where('extract(month from birth_date) = ?', Date.today.month).where('extract(day from birth_date) = ?', Date.today.day)}
  def send_admin_mail
    SignupMailer.signup_email(self).deliver
  end
end
