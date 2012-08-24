# == Schema Information
#
# Table name: contact_profiles
#
#  id         :integer          not null, primary key
#  kind       :string(255)
#  contact    :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ContactProfile < ActiveRecord::Base

  #
  # Accessors
  #
  attr_accessible :contact, :kind
end
