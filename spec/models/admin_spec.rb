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

require 'rails_helper'

RSpec.describe Admin, type: :model do
  it "has a valid factory" do
    expect(build(:admin)).to be_valid
  end

  subject(:admin) { build(:admin) }

  it 'is an admin' do
    expect(admin.admin?).to be_truthy
  end
end
