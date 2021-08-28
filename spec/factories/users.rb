FactoryBot.define do
  factory :user do
    username {Faker::Name.last_name}
    profile {"あああ"}
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
  end
end
