# == Schema Information
#
# Table name: legislatures
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  application_id :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Legislature < ActiveRecord::Base

  #
  # Accesors
  #
  attr_accessible :application_id, :name, :active

  #
  # Validations
  #
  validates :name, presence: true

  #
  # Associations
  #
  belongs_to :application

  #
  # Class methods
  #

  class << self
    def active
      where(active: true).first
    end
  end
end
