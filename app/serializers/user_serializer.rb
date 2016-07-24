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

class UserSerializer < ActiveModel::Serializer
  attributes :id, :email

  cache key: 'user', expires_in: 3.hours, only: [:id, :email]
end
