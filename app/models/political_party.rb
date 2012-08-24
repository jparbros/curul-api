class PoliticalParty < ActiveRecord::Base
  attr_accessible :application_id, :logo, :name, :initials
end
