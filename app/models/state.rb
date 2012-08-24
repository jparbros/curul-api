class State < ActiveRecord::Base
  attr_accessible :application, :name

  #
  # Associations
  #
  has_many :representatives
end
