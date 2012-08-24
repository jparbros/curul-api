class Commission < ActiveRecord::Base

  #
  # Attributes Accessors
  #
  attr_accessible :name

  #
  # Associations
  #
  belongs_to :applications
  has_and_belongs_to_many :representatives

end
