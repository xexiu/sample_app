class Micropost < ActiveRecord::Base
  attr_accessor :content
  belongs_to :user
  default_scope { order('microposts.created_at DESC') }
  # From Newest to Oldest
  validates :content, :presence => true, :length => { :maximum => 140 }
  validates :user_id, :presence => true
end
