# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string           not null
#

require 'rails_helper'

RSpec.describe User, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"

  it { should validate_presence_of(:username)}
  it { should validate_length_of(:password).is_at_least(6)}

  it { should validate_presence_of(:password_digest)}
  it { should validate_presence_of(:session_token)}
end
