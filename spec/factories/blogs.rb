FactoryBot.define do
  factory :blog do
    title {Faker::Name.last_name}
    body {"あああ"}

    association :user

  end
end
