class Comment < ActiveRecord::Base
  belongs_to :commentable
  attr_accessible :approved, :comment, :reply_to, :tendency, :title
end
