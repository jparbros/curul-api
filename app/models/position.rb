# == Schema Information
#
# Table name: positions
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  application_id :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Position < ActiveRecord::Base
  attr_accessible :application_id, :name
end
