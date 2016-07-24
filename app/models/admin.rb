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

class Admin < User

  def admin?
    true
  end
end
