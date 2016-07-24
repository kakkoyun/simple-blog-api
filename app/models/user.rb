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

class User < ApplicationRecord
  has_secure_password

  validates :type, presence: true
  validates :email,
            presence:   true,
            uniqueness: true,
            email:      true # email: {strict_mode: => true}
  validates :password,
            confirmation: true,
            presence:     true,
            length:       { within: 8..40 },
            on:           :create
  validates :password_confirmation,
            presence: true,
            on:       :create

  def admin?
    false
  end
end
