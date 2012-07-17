class Representative < ActiveRecord::Base
  attr_accessible :avatar, :biography, :birthday, :circumscription, :district, :election_type, :email, :first_name, :following, :last_name, :legislature_id, :number_votes, :phone, :political_party_id, :province_id, :region_id, :substitute_id
end
