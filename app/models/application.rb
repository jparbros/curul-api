# == Schema Information
#
# Table name: applications
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  access_token :string(255)
#

class Application < ActiveRecord::Base

  #
  # Accesors
  #
  attr_accessible :name

  #
  # Validations
  #
  validates :name, presence: true

  #
  # Associations
  #
  has_many :legislatures
  has_many :admins
  has_many :political_parties
  has_many :states
  has_many :commissions
  has_many :representatives

  #
  # Callbacks
  #
  before_create :generate_access_token

  #
  # Class methods
  #

  class << self
    def current
      @@current
    end

    def current=(current_app)
      @@current ||=current_app
    end
  end

  def active_legislature
    legislature.where(active: true).first
  end

  private

  def generate_access_token
    begin
      self.access_token = SecureRandom.hex
    end while self.class.exists?(access_token: access_token)
  end
end
