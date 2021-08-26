
FactoryBot.define do
  factory :admin do
    email { "admin@mail.com" }
    password {"password"}
    password_confirmation {"password"}
  end
end
