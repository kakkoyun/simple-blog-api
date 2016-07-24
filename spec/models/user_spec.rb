# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'

RSpec.describe User, type: :model do

  it "has a valid factory" do
    expect(build(:user)).to be_valid
  end

  context "validations" do

    it { should validate_presence_of(:email) }

    it { should validate_presence_of(:password) }

    it { should validate_presence_of(:password_confirmation) }
  end

  it 'is not a admin' do
    expect(build(:user).admin?).not_to be_truthy
  end
end
