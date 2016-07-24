FactoryGirl.define do

  factory :admin do
    type "Admin"
    email { Faker::Internet.email }
    password Faker::Internet.password(8, 40)
    password_confirmation { password }
  end
end
