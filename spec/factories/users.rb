# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  type            :string
#  email           :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

FactoryGirl.define do

  factory :user do
    type "User"
    email { Faker::Internet.email }
    password Faker::Internet.password(8, 40)
    password_confirmation { password }
  end
end
