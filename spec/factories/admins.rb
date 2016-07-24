FactoryGirl.define do

  factory :admin do
    type "Admin"
    email Faker::Internet.email
    password "password"
    password_confirmation "password"
  end
end
