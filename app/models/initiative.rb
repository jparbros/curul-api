class Initiative < ActiveRecord::Base
  belongs_to :representative
  attr_accessible :comments_count, :description, :main, :number, :official_vote_abstentions, :official_vote_down, :official_vote_up, :position, :presented_at, :state, :title, :voted_at, :year
end
