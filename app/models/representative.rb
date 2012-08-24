# == Schema Information
#
# Table name: representatives
#
#  id                 :integer          not null, primary key
#  first_name         :string(255)
#  last_name          :string(255)
#  avatar             :string(255)
#  biography          :text
#  birthday           :date
#  district           :string(255)
#  circumscription    :string(255)
#  phone              :string(255)
#  email              :string(255)
#  election_type      :string(255)
#  number_votes       :integer
#  region_id          :integer
#  province_id        :integer
#  political_party_id :integer
#  substitute_id      :integer
#  legislature_id     :integer
#  following          :boolean
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class Representative < ActiveRecord::Base

  #
  # Accessors
  #
  attr_accessible :avatar, :biography, :birthday, :circumscription, :district, :election_type, :email, :first_name, :following, :last_name, :legislature_id, :number_votes,
      :phone, :political_party_id, :province_id, :substitute_id, :substitute, :bithday, :state_id, :position

  #
  # Associations
  #
  has_many :contact_profiles
  belongs_to :state
  belongs_to :legislature
  belongs_to :political_party
  has_and_belongs_to_many :commissions

  #
  # Callbacks
  #
  before_create :assign_active_legislature


  private

  def assign_active_legislature
    self.legislature = Application.current.legislatures.active
  end
end
