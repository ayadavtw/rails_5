FactoryBot.define do
  factory :jwt_blacklist do
    jti { "MyString" }
    exp { "2020-05-14 00:51:19" }
  end
end
