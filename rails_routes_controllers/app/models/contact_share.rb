# == Schema Information
#
# Table name: contact_shares
#
#  id         :integer          not null, primary key
#  contact_id :integer          not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ContactShare < ActiveRecord::Base
  belongs_to :shared_contact,
    primary_key: :id,
    foreign_key: :contact_id,
    class_name: "Contact"

  belongs_to :shared_user,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: "User"
end
